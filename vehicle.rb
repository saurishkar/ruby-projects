# VEHICLE CLASS
class Vehicle
  def initialize(vehicle_name, price)
    @name = vehicle_name
    @price = price
  end

  def to_s
    "Bike Name: #{@name}\nBike Price: #{@price}\n"
  end
end

# BIKE CLASS, EXTENDS VEHICLE CLASS
class Bike < Vehicle
  def initialize(vehicle_name, price, dealer, percent_price_increase)
    super(vehicle_name, price)
    @dealer = dealer
    @percent_price_increase = percent_price_increase
  end

  def to_s
    super + "Bike Dealer: #{@dealer}\n"
  end

  def price_increase
    @price = (@price.to_f * (1 + @percent_price_increase.to_f / 100)).round(2)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  bike_obj = Bike.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  puts bike_obj
  print "\nAfter #{ARGV[3].to_f} percent hike in price:\n"
  bike_obj.price_increase
  puts bike_obj
end
