# ACCOUNT CLASS
class Account
  @@account_number = 0
  def initialize
    @account_no = @@account_number + 1
    @@account_number += 1
  end

  attr_accessor:name
  attr_accessor:balance

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
      account_obj = Account.new
      account_obj.name = params[0].gsub(/\"+/, '')
      account_obj.balance = params[1].to_i
      acc_obj_arr.push(account_obj)
    end
  end
  puts acc_obj_arr[0].view_account
  puts acc_obj_arr[1].view_account
end
