require('csv')
# class Employee
class Employee
  def initialize(emp_name, emp_id, designation)
    @emp_id = emp_id
    @name = emp_name
    @designation = designation
  end
end

# class File
class Company
  DESIGNATIONS = {
    dev: 'Developer',
    des: 'Designer',
    tes: 'Tester'
  }.freeze

  def initialize
    @employees = Hash.new({})
  end

  def add_employee(employee_obj)
    @employees[employee_obj.emp_id] = employee_obj
  end

  def group_employees_by_designation
    employees_by_designation = Hash.new({})
    @employees.to_a.map do |employee|
      employees_by_designation[employee.designation].push(employee.emp_id)
    end
    employees_by_designation
  end

  def save_employee_data_into_file
    employee_by_designation_hash = group_employees_by_designation
    file_obj = File.new('employees.txt', 'r+')
    

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
    company_obj = Company.initialize
    (1..data.length).each do |pos|
      record = data[pos]
      emp_obj = Employee.new(record[0], record[1], record[2])
      company_obj.add_employee(emp_obj)
    end
  end
end
