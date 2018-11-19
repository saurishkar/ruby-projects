class Vehicle
  def initialize(vehicleName, price)
    @name = vehicleName
    @price = price
  end

  def to_s
    "Bike Name: #{@name} \n Bike Price: #{@price}" 
  end

end

class Bike < Vehicle
  def initialize(dealer, percent_price_increase)
    @dealer = dealer
    @percent_price_increase = percent_price_increase
  end

  def display_contents
    puts "Bike Dealer: #{@dealer}"
  end

  def to_s
    "Bike Dealer: #{@dealer} Price Increase : #{@percent_price_increase}"
  end
end
