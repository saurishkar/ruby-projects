class Vehicle
  def initialize(vehicleName, price)
    @name = vehicleName
    @price = price
  end

  def to_s
    "\nBike Name: #{@name} \nBike Price: #{@price}\n" 
  end

end

class Bike < Vehicle
  def initialize(vehicleName, price, dealer, percent_price_increase)
    super(vehicleName, price)
    @dealer = dealer
    @percent_price_increase = percent_price_increase
  end

  def to_s
    super + "Bike Dealer: #{@dealer}"
  end

  def price_increase
      @price = (@price * (1 + @percent_price_increase / 100)).round(2)
  end
end

puts "Enter input"
strInput = gets.chomp

if strInput.empty?
  puts "Enter a valid Input"
else
  inputArr = strInput.split(/\s+/)
  bikeObj = Bike.new(inputArr[0], inputArr[1].to_f, inputArr[2], inputArr[3].to_f)
  puts bikeObj
  puts " ", "After #{inputArr[3].to_f} percent price hike:"
  bikeObj.price_increase
  puts bikeObj
end

