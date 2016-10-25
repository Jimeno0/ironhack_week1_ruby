require 'pry'

class Home
  attr_accessor :name, :city, :capacity, :price

  def initialize(name, city, capacity,price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Richie's place", "Alcorcon", 1, 40),
  Home.new("Mario's place", "Madrid", 6, 48),
  Home.new("Miguel's place", "Barna", 3, 31),
  Home.new("Carlos's place", "Toledo", 2, 50),
  Home.new("Daichi's place", "Japon", 5, 55)
]


#Printing the houses
def house_printer (houses_arr)
  houses_arr.each { |home| 
    puts "#{home.name} in #{home.city} \nPrice: #{home.price} a night"
  }
end
puts "List of houses: "
house_printer(homes)
puts "\n"


#Sorting by price
def sort_houses(homes,sorted_by=1)
  if sorted_by == 2
    sorted_houses = homes.sort { |a, b| b.price <=> a.price }
  elsif sorted_by == 3
    sorted_houses = homes.sort { |a, b| a.capacity <=> b.capacity }
  elsif sorted_by == 4
    sorted_houses = homes.sort { |a, b| b.capacity <=> a.capacity }
  else 
    sorted_houses = homes.sort { |a, b| a.price <=> b.price }
  end
end

puts "Houses sorted by price: "
house_printer(sort_houses(homes))
puts"\n"

puts "What sort method do you prefer?
      1. Sorted by price ascendent
      2. Sorted by price descendent
      3. Sorted by capacity ascendent
      4. Sorted by capacity descendent"
sorted_by = gets.chomp.to_f
house_printer(sort_houses(homes,sorted_by))


#Select by city
puts "Type the city that you want to locations"
city = gets.chomp.downcase

city_homes = homes.select{|home|
 home.city.downcase == city.downcase
}

puts house_printer(city_homes)

#Get prices average
puts "Homes average price: "
prices = homes.map { |home| home.price}
prices_average = prices.reduce { |sum,price| sum + price }/ prices.length
puts prices_average
puts "\n"


#Giving the user the option to enter a price
puts "Enter the the house price you want to know"
price_to_find = gets.chomp

finded_home = homes.find{|home|
 home.price == price_to_find.to_i
}
puts puts "#{finded_home.name} in #{finded_home.city} \nPrice: #{finded_home.price} a night"
