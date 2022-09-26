# product class
class Product
  SALES_TAX_RATE = 0.1
  IMPORT_DUTY = 0.05
  BOOLEAN_EXP = /true/i

  attr_reader :price_with_tax

  def initialize(name, imported, tax_exempted, price)
    @name = name
    @tax_exempted = !(tax_exempted =~ BOOLEAN_EXP).nil?
    @imported = !(imported =~ BOOLEAN_EXP).nil?
    @price = price.to_f
    @price_with_tax = calculate_price_with_tax
  end

  def to_s
    puts "Product Name: #{@name.capitalize}"
    puts "Product Price: $ #{@price}"
    puts "Product Price w/Tax: $ #{@price_with_tax.round(2)}"
    puts "Is Imported: #{@imported ? 'Yes' : 'No'}"
    puts "Is Tax Exempted: #{@tax_exempted ? 'Yes' : 'No'}"
    1.upto(30).each { print '-' }
    ''
  end

  private

  def calculate_import_duty
    @imported ? @price * IMPORT_DUTY : 0
  end

  def calculate_sales_tax
    @tax_exempted ? 0 : @price * SALES_TAX_RATE
  end

  def calculate_price_with_tax
    @price + calculate_sales_tax + calculate_import_duty
  end
end

# class Sales
class Sales
  DEFAULT_SALES = 0.0

  def initialize
    @products = []
  end

  def add_product(name, imported, tax_exempted, price)
    product = Product.new(name, imported, tax_exempted, price)
    @products.push(product)
  end

  def generate_invoice
    display_product_list
    puts "Total Sales: #{calculate_total_sales}", ''
  end

  def display_product_list
    puts '', 'Product List:'
    1.upto(30).each { print '-' }
    puts '', @products
  end

  private

  def calculate_total_sales
    @products.inject(DEFAULT_SALES) do |sum, product_obj|
      sum + product_obj.price_with_tax
    end
  end
end

terminate = 'n'
error_msg = 'Invalid input. Please enter a valid input again.'
sales_obj = Sales.new
while terminate !~ /yes|y/i
  imported = '', exempted = '', name = '', price = ''

  print 'Name of the product: '
  name = gets.chomp
  loop do
    print 'Imported? (true/false): '
    imported = gets.chomp
    break if imported =~ /true|false/i
    puts error_msg, ''
  end

  loop do
    print 'Exempted from sales tax? (true/false): '
    exempted = gets.chomp
    break if exempted =~ /true|false/i
    puts error_msg, ''
  end

  loop do
    print 'Price: '
    price = gets.chomp
    break if price =~ /([0-9])(.[0-9])?/
    puts error_msg, ''
  end

  sales_obj.add_product(name, imported, exempted, price)

  print 'Do you want to terminate ? (Y/N/Yes/No/YES/NO)'
  terminate = gets.chomp
end
sales_obj.generate_invoice
