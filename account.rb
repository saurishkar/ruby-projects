class Account
	@@account_number = 0
	def initialize(name, balance)
		@name = name
		@account_no = @@account_number + 1
		@balance = balance

		@@account_number = @@account_number + 1
	end

	def deposit(amount)
		@balance = @balance + amount.to_i
	end

	def withdraw(amount)
		@balance = @balance - amount.to_i
	end

	def view_account()
		puts "Account Number: #{@account_no}"
		puts "Account Holder Name: #{@name}"
		puts "Account Balance: #{@balance}"
	end

end


puts "Enter input"
str = gets.chomp

if str.nil?
	puts "Enter a valid Input"
else
	accountObjArr = []
	arr = str.split(/\s+/)

	arr.each do |st|
		params = st.split(/:/)
		if params[0] == "transfer"
			accountObjArr[0].withdraw(params[1])
			accountObjArr[1].deposit(params[1])
		else 
			accountObjArr.push(Account.new(params[0].gsub!(/\"+/, ""), params[1].to_i))
		end
	end

	puts accountObjArr[0].view_account
	puts accountObjArr[1].view_account
end