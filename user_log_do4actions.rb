require "pry"
require "colorize"

class Loggin
  def initialize(users)
    @users = users
    @logginStatus = false
  end
  def try
    while @logginStatus == false
      puts"Enter name:"
      @name = gets.chomp
      puts"Enter pass:"
      @pass = gets.chomp
        @users.each do |user|  
          if user[:name] == @name && user[:pass] == @pass
            puts"loggin success".colorize(:green)
            @logginStatus = true
          end
        end
        if @logginStatus == false
          puts "Try again".colorize(:red) 
        end
    end
  end
end

class Counter
  def self.words(text)
    
    text.split( " ").length
  end 
  def self.letters(text)
    text.sub(" ","").length
  end
end


class Transformer
  def self.reverse(text)
    text.reverse
  end
  def self.upcase(text)
    text.upcase
  end
  def self.downcase(text)
    text.downcase
  end
end

class Menu
  def self.action(text)
    puts "What do tou whant to do with it:\n 1. Count words\n 2. Count letters\n 3. Reverse text\n 4. Upcase text\n 5. Lowercase text"
    selected = gets.chomp
    if selected == "1"
      Counter.words(text)
    elsif selected == "2"
      Counter.letters(text)
    elsif selected == "3"
      Transformer.reverse(text)
    elsif selected == "4"
      Transformer.upcase(text)
    elsif selected == "5"
      Transformer.downcase(text)
    end
  end
end


users = [{name: "Carlos",pass: "1234"},{name: "Laura",pass: "4321"}]
new_loggin = Loggin.new(users)
new_loggin.try
puts "type a sentence"
text = gets.chomp
puts Menu.action(text)








