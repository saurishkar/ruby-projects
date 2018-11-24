# ACCOUNT CLASS
class Account
  @@account_number = 0
  def initialize(holder_name, balance)
    @name = holder_name
    @account_no = @@account_number + 1
    @balance = balance

    @@account_number += 1
  end

  def deposit(amount)
    @balance += amount.to_i
  end

  def withdraw(amount)
    @balance -= amount.to_i
  end

  def view_account
    puts "Account number: #{@account_no}"
    puts "Account holder name: #{@name}"
    puts "Account balance: #{@balance}"
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  acc_obj_arr = []

  ARGV.each do |st|
    params = st.split(/:/)
    if params[0] == 'transfer'
      acc_obj_arr[0].withdraw(params[1])
      acc_obj_arr[1].deposit(params[1])
    else
      acc_obj_arr.push(Account.new(params[0].gsub(/\"+/, ''), params[1].to_i))
    end
  end
  puts acc_obj_arr[0].view_account
  puts acc_obj_arr[1].view_account
end
