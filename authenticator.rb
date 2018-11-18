def checkUser
	print "\nPlease enter your username and password when prompted\n"

	print "Username: "
	username = gets

	print "Password: "
	password = gets

end

print "\nWelcome to Authenticator\n"

25.times {print "-"}

attempts = 1
choice = 0
username = ""
password = ""

while choice != 2
	print "\nYour Options\n"
	print "\n1. Check user"
	print "\n2. Quit"
	print "\n\nYour Response: "
	choice = gets.to_i
	# puts "Choice Entered: #{choice}"
	if choice == 1
		checkUser()
	elsif choice == 2
		puts "Bye!"
		break
	end
end

