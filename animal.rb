class Animal
    attr_accessor :hunger, :health
    attr_accessor :hygine, :fun, :name
  
    @@pet_breed = %w[cat dog].sample
  	MAX_POINTS = 100
	
    def initialize
      @name = name
      @health = health
      @hunger = hunger
      @hygine = hygine
      @fun = fun
    end
  
    def new_game
      Animal.new
      Animal.opening
      Animal.health_status
      Animal.care
      puts 'Your game is over.'
    end
  
    def self.opening
      puts 'You are taking a walk one night when suddenly you hear a noise.'
      puts 'It is coming from some bushes!'
      puts 'Do you want to check it out? y/n'
      answer = gets.chomp
      if answer == 'y'
        puts 'You walk up to the bushes and look through......'
        puts "You found a #{@@pet_breed}."
        @health = 90
        @hunger = 90
        @hygine = 90
        @fun = 90
        name_pet
        puts "Your options are to 'clean', 'feed' and 'play'"
      Animal.pet_status(@name)
      elsif answer == 'n'
        puts 'You start to hurry away but you hear something starts to follow you.'
        puts "You slowly turn around and see a #{@@pet_breed} looking at you sadly."
        @health = 50
        @hunger = 50
        @hygine = 50
        @fun = 50
        puts 'Because of your choice your pet status was affected.'
        name_pet
        puts "Your options are to 'clean', 'feed', 'play' and 'exit' "
      Animal.pet_status(@name)
      else
        'Invalid input. Try again'
      end
    end
  
    def self.care
      while alive
        answer2 = gets.chomp
        if answer2=="exit"
          break
        end  
        if answer2 == 'clean'
          Animal.clean
          puts 'Your pets hygine status has been updated.'
          Animal.hygine_status
          Animal.pet_status(@name)
          
  
        elsif answer2 == 'feed'
          Animal.feed
          puts 'Your pets hunger status has been updated.'
          Animal.health_status
          Animal.hunger_status
          Animal.pet_status(@name)
          
        elsif answer2 == 'play'
          Animal.play
          puts 'Your pets fun status has been updated.'
          Animal.fun_status
          Animal.pet_status(@name)
        else
          'Nothing'
        end
      Animal.deplete  
    end
	end
  
    def self.name_pet
      puts 'What do you you wanna name your pet?'
      @name = gets.chomp
      puts "#{@name} smiles at you happily."
    end
  
    def self.pet_status(_name)
      puts "Health: #{@health}/#{MAX_POINTS}"
      puts "Hunger: #{@hunger}/#{MAX_POINTS}"
      puts "Hygine: #{@hygine}/#{MAX_POINTS}"
      puts "Fun: #{@fun}/#{MAX_POINTS}"
    end
  
    def self.health_status
      case @health
      when 0
        puts "You have not been taking care of #{@name}."
        puts "#{@name} slowly dissapears......:("
      when 1..25
        puts " Your pet is coming down with pneumonia. #{@name} health is decreasing rapidly"
        puts "You need to let #{@name} rest."
      when 25..50
        puts "#{@name} is feeling really sleepy."
      when 50..75
        puts "#{@name} is feeling tired."
      when 75..100
        puts "#{@name} is full of energy."
      when 100
        puts "#{pet} is extremly healthy."
        end
    end
  
    def self.hunger_status
      case @hunger
      when 0
        puts "You forgot to feed #{@name}."
        puts 'try better!'
      when 1...25
        puts "#{@name} is dying from starvation."
      when 25..50
        puts "#{@name} is feeling really hungry."
      when 50..75
        puts "#{@name} is kind of hungry."
      when 75..100
        puts "#{@name} is still full."
      when 100
        puts "#{pet} is extremly full."
        end
    end
  
    def self.fun_status
      case @fun
      when 0
        puts "#{@name} has dissapeared because of neglect."
      when 1...25
        puts "#{@name} is whimpering. Try cheering your pet up."
      when 25..50
        puts "#{@name} is lookes extremyly depressed."
      when 50..75
        puts "#{@name} is feeling okay..."
      when 75..100
        puts "#{@name} is giving you a smile."
      when 100
        puts "#{@pet} is beaming wiith rainbows and unicorns!"
        end
    end
  
    def self.hygine_status
      case @hygine
      when 0
        puts "#{@name} is extremly dirty and poop is everywhere."
      when 1...25
        puts "#{@name} is dirty."
      when 25..50
        puts "#{@name} is slightly dirty."
      when 50..75
        puts "#{@name} has made a poop."
      when 75..100
        puts "#{@name} is clean."
      when 100
        puts "#{@pet} is extremly clean."
        end
    end
  
    def self.alive
      @health > 0
      end
  
    def self.feed
      @hunger += rand(15)
      @health += rand(5)
      end
  
    def self.play
      @fun += rand(15)
      @health -= rand(7)
      @hygine -= 5
        if @hygine < 0
          @health = 0
        end
      end

    def self.clean
      @hygine += rand(15)
      @fun += rand(3)
      @health += rand(7)
    end
    
    def self.deplete
      @hygine -=rand(5)
      if @hygine <0
        @health=0
      end
      @fun -=rand(5)
      if @fun < 0
        @health = 0
      end
      @hunger -=rand(5)
      if @hunger < 0
        @health=0
      end
      @health -= rand(5)
    end
  end

  class Game
    def initialize
      @animal = Animal.new
      @animal.new_game
    end
  end
  
  Game.new