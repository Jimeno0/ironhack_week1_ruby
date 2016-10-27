require 'pry'

class ShoppingCart
  def initialize
    @items = {}
    @products = {
      apples: 10,
      oranges: 5,
      grapes: 15,
      banana: 20,
      watermelon: 50
    }
  end

  def add_item(sym)
    @items[sym] || @items[sym] = 0
    @items[sym] += 1
  end
  
  def show
    @items.each do |k,v|
      puts "#{v}. #{k.to_s} #{@products[k]}$"
    end
  end

  def cost
    sum = 0
    @items.each do |k,v|
      sum += @products[k] * v
    end
    sum
  end

end


# Buy 2 apples and pay just one!
# Buy 3 oranges and pay just 2!
# Buy 4 grapes you get one banana for free if you want!


cart = ShoppingCart.new

cart.add_item :apples
cart.add_item :banana
cart.add_item :banana

cart.show

puts cart.cost
