require "pry"
require "colorize"

class Space
  attr_reader :canMove
  attr_accessor :initMsg
  def initialize

    @exits = {
      north: [true, false].sample,
      west: [true, false].sample,
      east: [true, false].sample,
      south: [true, false].sample
    }
    while @exits[:north] == false && @exits[:west] == false && @exits[:east] == false && @exits[:south] == false
      @exits = {
        north: [true, false].sample,
        west: [true, false].sample,
        east: [true, false].sample,
        south: [true, false].sample
      }
    end
    @obstacle = true
    @canMove = false
  end

  def move(direction)
    if direction == "N" && @exits[:north] == true && @obstacle == false
      @canMove = true
    elsif direction == "W" && @exits[:west] == true && @obstacle == false
      @canMove = true
    elsif direction == "E" && @exits[:east] == true && @obstacle == false
      @canMove = true
    elsif direction == "S" && @exits[:south] == true && @obstacle == false
      @canMove = true
    else
      if @obstacle == true
        puts "Cant move! You should do something first..."
      else
        puts "No doors there"  
      end
    end

    if @canMove == true
      puts"Yippi kay yai! Looks like a door to open! What will be in the next door..."
    end
  end
end

class WitchRoom < Space
  def initialize
    super
    @initMsg = "OMG there is a witch in this room!! What can you do?"
  end

  def action (action)
    if action.downcase == "sing"
      @obstacle = false
      puts "yeah! You sing reaaaaly bad and therefore the witch ran out!"

    elsif action.downcase == "hit"
      puts "What a pussy hit!"
    else
      puts "Nothing happend"
      
    end
  end
end

class TrupRoom < Space
  def initialize
    super
    @initMsg = "Lucky you! Donald trup is in front of you"
  end
  def action (action)
    if action.downcase == "hit"
      @obstacle = false
      puts "yeah! Just in the face. Trump down! Rock it!"
        
    else
      puts "Nothing happend"

    end
  end
end

class BarbedWire < Space
  def initialize
    super
    @initMsg = "The room is plenty or barbed wire, what can you do to move arround?"
  end
  def action (action)
    if action.downcase == "bend"
      @obstacle = false
      puts "yeah! you gone to ground,find the next door!"
        
    else
      puts "Nothing happend"
    end
  end

end

class MichaelJackson < Space
  def initialize
    super
    @initMsg = "Hooooray Michael Jackson is in the house!"
  end
  def action (action)
    
    if action.downcase == "dance"
      @obstacle = false
      puts "Yeah you give MJ the pleasure of one more dance, he's hedding back to the graveyard"
        
    else
      puts "looks like MJ want to dance"
    end
  end
end

class GamePlay
  attr_reader :currentPlace
  def initialize (levels)
    @completed_levels = []
    print_welcome_msg

    levels.times do 
      create_new_scenario
      binding.pry
      @currentPlace.initMsg = "Nothing to do here, go back to the show!!"
      @completed_levels.push(@currentPlace)
      
    end

    end_game
  end

  def print_welcome_msg
    puts "******************************".colorize(:red)
    puts "Welcome to the game of rooms!!".colorize(:red)
    puts "******************************".colorize(:red)
    puts "You yout landed in a dark room and you just know how to:"
    puts "* Move in the #{"N".colorize(:green)}/#{"W".colorize(:green)}/#{"E".colorize(:green)}/#{"S".colorize(:green)} directions."
    puts "* #{"sing".colorize(:green)}/#{"hit".colorize(:green)}/#{"bend".colorize(:green)}/#{"dance".colorize(:green)}"
    puts "- You can save anytime typing #{"SAVE".colorize(:green)} and load typing #{"LOAD my_game_name.txt".colorize(:green)}"
    puts  "but wait a second! somethings going to happend......"
  end

  def do_something
    puts ">"
    new_action = gets.chomp
    if new_action == "N" || new_action == "S" || new_action == "W" || new_action == "E"
      @currentPlace.move(new_action)
    elsif new_action == "sing" || new_action == "hit" || new_action == "bend" || new_action == "dance"
      @currentPlace.action(new_action)
    end
  end
  
  def create_new_scenario
    @currentPlace = [MichaelJackson.new, BarbedWire.new, TrupRoom.new, WitchRoom.new].sample
    puts @currentPlace.initMsg
    while @currentPlace.canMove == false
      do_something
    end
  end

  def save_game
    
  end

  def load_game
    
  end

  def end_game
    puts "Hoooooray you are free to go!!"
  end
end



GamePlay.new(3)