class Enemy
	attr_accessor :name
	def initialize(name)
		@name = name
	end
end

class Goblin < Enemy
	attr_accessor :elementWeakness
	attr_accessor :health
	attr_accessor :maxHealth

	def initialize(name)
		super(name)
		@maxHealth = 50
		@health = 50
		@elementWeakness = 'Air'
	end

	def choose_attack()
		attackChoice = rand(1..2)
		if attackChoice == 1
			attackName ='Goblin Stomp'
			attackDmg = rand(1..5)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg 
		else
			attackName = 'Spiked Club'
			attackDmg = rand(3..6)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg
		end
	end
end

class Merman < Enemy
	attr_accessor :elementWeakness
	attr_accessor :health
	attr_accessor :maxHealth

	def initialize(name)
		super(name)
		@maxHealth = 80
		@health = 80
		@elementWeakness = 'Earth'
	end

	def choose_attack()
		attackChoice = rand(1..2)
		if attackChoice == 1
			attackName ='Aqua Claw'
			attackDmg = rand(5..10)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg 
		else
			attackName = 'Jetstream'
			attackDmg = rand(4..8)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg
		end
	end	
end

class Gryphons < Enemy
	attr_accessor :elementWeakness
	attr_accessor :health
	attr_accessor :maxHealth

	def initialize(name)
		super(name)
		@maxHealth = 80
		@health = 80
		@elementWeakness = 'Fire'
	end

	def choose_attack()
		attackChoice = rand(1..2)
		if attackChoice == 1
			attackName ='Razor Beak'
			attackDmg = rand(5..10)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg 
		else
			attackName = 'Talon Frenzy'
			attackDmg = rand(4..8)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg
		end
	end
end

class JoeMole < Enemy
	attr_accessor :elementWeakness
	attr_accessor :health
	attr_accessor :maxHealth

	def initialize(name)
		super(name)
		@maxHealth = 150
		@health = 150
		@elementWeakness = 'Air'
	end

	def choose_attack()
		attackChoice = rand(1..2)
		if attackChoice == 1
			attackName ='Nani Slap'
			attackDmg = rand(1..2)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg 
		else
			attackName = 'Nani Dig'
			attackDmg = rand(3..4)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg
		end
	end
end

class MagmaGiant < Enemy
	attr_accessor :elementWeakness
	attr_accessor :health
	attr_accessor :maxHealth

	def initialize(name)
		super(name)
		@maxHealth = 150
		@health = 150
		@elementWeakness = 'Water'
	end

	def choose_attack()
		attackChoice = rand(1..4)
		if attackChoice == 1 || attackChoice == 2
			attackName ='Fiery Rampage'
			attackDmg = rand(20..25)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg 
		elsif attackChoice == 3
			attackName = 'Colossal Fist'
			attackDmg = rand(15..25)
			puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
			return attackName, attackDmg
		else
			attackName = "Roar"
			attackDmg = 0
			puts "The giant roars in rage"
			return attackName, attackDmg
		end
	end	
end

class FallenKing < Enemy
	attr_accessor :elementWeakness
	attr_accessor :health
	attr_accessor :maxHealth
	
	def initialize(name)
		super(name)
		@maxHealth = 200
		@health = 200
		@elementWeakness = 'Light'
	end

	def choose_attack()
		
		if @health > 100
			attackChoice = rand(1..2)
			if attackChoice == 1
				attackName ='Soul Grasp'
				attackDmg = rand(5..10)
				puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
				return attackName, attackDmg 
			else
				attackName = 'Undead Wind'
				attackDmg = rand(6..12)
				puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
				return attackName, attackDmg
			end
		else
			attackChoice = rand(1..3)
			if attackChoice == 1
				attackName ='Endless Fear'
				attackDmg = rand(12..13)
				puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
				return attackName, attackDmg 
			elsif attackChoice == 2
				attackName = 'Fallen Journey'
				attackDmg = rand(10..20)
				puts "#{@name}: #{attackName} has dealt #{attackDmg} damage"
				return attackName, attackDmg
			else
				attackName = 'Mockery'
				attackDmg = 0
				puts "The king laughs at your misery"
				return attackName, attackDmg
			end
		end
	end	
end