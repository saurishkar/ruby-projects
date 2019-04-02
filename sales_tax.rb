# product class
class Product
  SALES_TAX_RATE = 0.1
  IMPORT_DUTY = 0.05
  attr_reader :price_with_tax
  def initialize(name, imported, tax_exempted, price)
    @name = name
    @tax_exempted = tax_exempted
    @imported = imported
    @price = price.to_f
    @price_with_tax = calculate_price_with_tax
  end

  def imported?
    @imported =~ /[yes|y]/i
  end

  def tax_exempted?
    @tax_exempted =~ /[yes|y]/i
  end

  def to_s
    puts "Product Name: #{@name.capitalize}"
    puts "Product Price: $ #{@price}"
    puts "Product Price w/Tax: $ #{@price_with_tax.round(2)}"
    puts "Is Imported: #{imported? ? 'Yes' : 'No'}"
    puts "Is Tax Exempted: #{tax_exempted? ? 'Yes' : 'No'}"
    1.upto(30).each { print '-' }
    ''
  end

  private

  def calculate_price_with_tax
    tax = 0.0
    tax += SALES_TAX_RATE unless tax_exempted?
    tax += IMPORT_DUTY if imported?
    @price.to_f * (1 + tax)
  end
end

# class Sales
class Sales
  def initialize
    @products = []
  end

  def add_product(name, imported, tax_exempted, price)
    product = Product.new(name, imported, tax_exempted, price)
    @products.push(product)
  end

  def generate_sales_invoice
    total_sales = calculate_sales
    display_product_list
    puts "Total Sales: #{total_sales}", ''
  end

  def display_product_list
    puts '', 'Product List:'
    1.upto(30).each { print '-' }
    puts ''
    puts @products
  end

  private

  def calculate_sales
    @products.inject(0.0) do |sum, product_obj|
      sum += product_obj.price_with_tax
      sum
    end
  end
end

terminate = 'n'
sales_obj = Sales.new
while terminate !~ /[Y|YES]/i
  print 'Name of the product: '
  name = gets.chomp
  print 'Imported?: '
  imported = gets.chomp
  print 'Exempted from sales tax: '
  exempted = gets.chomp
  print 'Price: '
  price = gets.chomp

  sales_obj.add_product(name, imported, exempted, price)

  print 'Do you want to terminate ? (Y/N)'
  terminate = gets.chomp
end
sales_obj.generate_sales_invoice
# printf('Total Sales: ', sales_obj.calculate_sales.round)
