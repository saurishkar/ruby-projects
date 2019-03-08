require('csv')
# class Employee
class Employee
  attr_accessor :emp_id, :name, :designation
  def initialize(emp_name, emp_id, designation)
    @emp_id = emp_id
    @name = emp_name
    @designation = designation
  end
end

# class Company
class Company
  attr_accessor :employees
  def initialize
    @employees = Hash.new({})
  end

  def add_employee(employee_obj)
    @employees[employee_obj.emp_id] = employee_obj
  end

  def group_and_sort_employees_by_designation
    employees_by_designation = Hash.new { |h, k| h[k] = [] }
    @employees.to_a.each do |employee|
      name = employee[1].name
      emp_id = employee[1].emp_id
      designation = employee[1].designation
      employees_by_designation[designation].push("#{name} (EmpId: #{emp_id})")
    end
    employees_by_designation.sort.to_h
  end

  def save_employee_data_into_file
    employee_by_designation_hash = group_employees_by_designation
    File.open('employees.txt', 'w') do |file|
      employee_by_designation_hash.to_a.each do |emp_array|
        designation = "#{emp_array[0]}#{'s' if emp_array[1].length > 1}"
        file.write("#{designation}\n")
        emp_array[1].each { |emp| file.write("#{emp}\n") }
        file.write("\n")
      end
    end
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  begin
    data = CSV.read(ARGV[0])
  rescue StandardError => err
    puts err
  else
    company_obj = Company.new
    1.upto(data.length - 1) do |pos|
      record = data[pos]
      emp_obj = Employee.new(record[0], record[1], record[2])
      company_obj.add_employee(emp_obj)
    end
    company_obj.save_employee_data_into_file
  end
end
