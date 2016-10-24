require "pry"

#class
class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end

#instancing objects
ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

#array of objects
array_of_languages = [ruby, python, javascript, go, rust, swift, java]

#function print all arrays
def array_printer(array)
  array.each do |language|
    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
  end
end

#default
array_printer(array_of_languages)
puts "\n"

# MAP
aged_languages = array_of_languages.map do |language|
  language.age += 1
  language
end
puts "The programming languages aged one year are: "
array_printer(aged_languages)
puts "\n"

#SORT
sorted_languages = aged_languages.sort do |lx, ly|
  ly.age <=> lx.age
end
puts "The programming languages sorted by aged are: "
array_printer(sorted_languages)
puts "\n"

#DELETE
puts "The programming languages without java: "
languages_without_java = sorted_languages.delete_if { |language| language.name == "Java" }
array_printer(languages_without_java)
puts "\n"

#SHUFFLE
puts "The programming languages shuffled: "
shuffled_languages = languages_without_java.shuffle
array_printer(shuffled_languages)
puts "\n"


#POP would be usefull in a lifo(last in first out)
puts "The programming languages being poped: "
array_of_languages.pop
array_printer(array_of_languages)
puts "\n"

#SAMPLE to get a random element or elements. To pick wich languages to learn today
puts "The two random programming languages are: "
random_languages = array_of_languages.sample(2)
array_printer(random_languages)
puts "\n"

#TAKE: get the n first elements
puts "The 3 firsts programming are: "
firsts_languages = array_of_languages.take(3)
array_printer(firsts_languages)
puts "\n"

#BONUS RESEARCH: Will modify the current array
puts "The programming!!! languages!!! array with the bonus research: "
array_of_languages.map! do |language| 
  language.name += "!!!"
  language
end
array_printer(array_of_languages)