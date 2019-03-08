# product class
class Product
  attr_reader :price, :name, :is_tax_exempted, :is_imported
  def initialize(name, is_imported, is_tax_exempted, price)
    @name = name
    @is_tax_exempted = is_tax_exempted
    @is_imported = is_imported
    @price = price.to_f
  end
end

# class Sales
class Sales
  SALES_TAX_RATE = 0.1
  IMPORT_DUTY = 0.05
  attr_reader :products
  def initialize
    @products = []
  end

  def add_product(name, is_imported, is_tax_exempted, price)
    product = Product.new(name, is_imported, is_tax_exempted, price)
    @products.push(product)
  end

  def display_product_list
    puts '', 'Product List:', ''
    @products.each do |product_obj|
      print product_obj.name.capitalize, "\n"
      print "$#{product_obj.price}\n"
      print "Imported \n" if /yes/ =~ product_obj.is_imported
      print "Exempted from Tax\n" if /yes/ =~ product_obj.is_tax_exempted
      puts ''
    end
  end

  def calculate_sales
    @products.inject(0.0) do |sum, product_obj|
      sum += if /no/ =~ product_obj.is_tax_exempted
               product_obj.price * (1 + SALES_TAX_RATE)
             elsif /yes/ =~ product_obj.is_imported
               product_obj.price * (1 + IMPORT_DUTY)
             else
               product_obj.price
             end
      sum
    end
  end
end

terminate = 'y'
sales_obj = Sales.new
until terminate =~ /n/
  print 'Name of the product: '
  name = gets.chomp
  print 'Imported?: '
  is_imported = gets.chomp
  print 'Exempted from sales tax: '
  is_exempted = gets.chomp
  print 'Price: '
  price = gets.chomp

  sales_obj.add_product(name, is_imported, is_exempted, price)

  print 'Do you want to add more items to your list(y/n): '
  terminate = gets.chomp
end
sales_obj.display_product_list
puts sales_obj.calculate_sales
# printf('Total Sales: ', sales_obj.calculate_sales.round)
