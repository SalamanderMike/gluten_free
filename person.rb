# gluten_free
# coded by Mike McClure
class Person
  @@allergens = /peas|bread|milk|almonds/i
  def initialize(hungry, name)
    @hungry = hungry
    @name = name
    @sick = false
  end

  def eat(food)
    unless @@allergens.match(food)
      puts "yummm!!! #{food} is great!"
    else
      allergy_error(food)
    end
  end

  def allergy_error(food)
    puts "Ack!!! You just threw up #{food}!"
    puts "I'm sorry, #{@name}, I guess you were allergic to #{food}"
    @sick = true
    bye(@name, @sick)
  end

end


# PREPARE FOR PERSON CLASS
def feed_me(name, hungry, food)
  person = Person.new(hungry, name)
  food_list = food.split(/,\s*/)

  food_list.map do |food|
    person.eat(food)
  end
end

def bye(name, sick=false)
  puts "Okeydoke! Bye bye, #{name}!"
  if sick
    puts "Feel better!!!"
  end
exit

end

def greet
  puts "Hey there! What's your name?"
  name = gets.chomp.capitalize
  puts "Awesome, #{name}! Are you hungry?"
  hungry = gets.chomp.downcase
  if (hungry == "y") || (hungry == "yes")
    puts "Sweet! What are you hungry for?"
    puts "Go ahead, give me a list of all the things you want"
    puts "separated by commas."
    food = gets.chomp
    feed_me(name, hungry, food)
  end
  bye(name)
end

# START
greet






