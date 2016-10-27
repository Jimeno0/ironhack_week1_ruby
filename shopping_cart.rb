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
    @items.each do |k,units|
      puts "#{units}. #{k.to_s} #{@products[k]}$"
      if k == :grapes
        add_free_banana(units)  
      end
    end
  end

  def cost
    sum = 0
    @items.each do |k,units|
      if k == :apples
        sum += @products[k] * apple_units_to_pay(units)
      elsif k == :oranges
        sum += @products[k] * oranges_units_to_pay(units)
      else
        sum += @products[k] * units
      end
    end
    sum
  end

  def apple_units_to_pay(units)  
    (units/2) + units%2
  end

  def oranges_units_to_pay(units)  
    ((units/3)*2) + units%3
  end

  def grapes_units_to_pay(units)
    add_free_banana(units/4)
    units
  end

  def add_free_banana(grapes)
    if grapes >= 4
      puts "You can get #{grapes/4} free bananas because you bought #{grapes} grapes"
    end
  end
end


# Buy 2 apples and pay just one!
# Buy 3 oranges and pay just 2!
# Buy 4 grapes you get one banana for free if you want!



cart = ShoppingCart.new

cart.add_item :apples
cart.add_item :apples
cart.add_item :banana
cart.add_item :banana
cart.add_item :oranges
cart.add_item :oranges
cart.add_item :oranges
cart.add_item :grapes
cart.add_item :grapes
cart.add_item :grapes
cart.add_item :grapes
cart.show

puts cart.cost
