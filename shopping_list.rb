# class List
class List
  def initialize
    @items = []
  end

  def items(&proc)
    instance_eval(&proc)
  end

  def add(product_name, product_price)
    @items.push(Item.new(product_name, product_price))
  end

  def display_list
    puts @items, ''
  end
end

# class Item
class Item
  def initialize(product_name, product_price)
    @product_name = product_name
    @product_price = product_price
  end

  def to_s
    puts '', "Product Name: #{@product_name}"
    puts "Product Price: $#{@product_price}", ''
    1.upto(10) { print '-' }
    ''
  end
end

sl = List.new
sl.items do
  add('Toothpaste', 2)
  add('Computer', 1)
end
sl.display_list
