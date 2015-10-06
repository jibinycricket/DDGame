class Hero
	attr_accessor :name
	attr_accessor :elementWeakness
	def initialize(name)
		@name = name
		@elementWeakness = 'Nothing'
	end
end

class KingsMage < Hero

	attr_accessor :CLASS_NAME
	attr_accessor :maxHealth
	attr_accessor :health
	attr_accessor :moveList

	def initialize(name)
		super(name)	
		@CLASS_NAME = "Mage"
		@maxHealth = 150
		@health = 150
		@lastSpell = 'None'
		@spellCount = {'Flames of Vulcan' => 2, 'Waves of Neptune' => 2, 'Thorns of Gaia' => 2, 'Fury of Zeus' => 2}
		@moveList = ['Flames of Vulcan', 'Waves of Neptune', 'Thorns of Gaia', 'Fury of Zeus']
	end
	
	def choose_attack()
		attackChoice = 0
		#Check for mage valid user input
		attackChoice = rand(1..4)
	
		#Chooses skill(1-4)
		if attackChoice == 1
			attackName = 'Flames of Vulcan'
			element = 'Fire'
			damage, @lastSpell = mage_dmg_calculation(attackName, @lastSpell)
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		elsif attackChoice == 2
			attackName = 'Waves of Neptune'
			element = 'Water'
			damage, @lastSpell = mage_dmg_calculation(attackName, @lastSpell)
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		elsif attackChoice == 3
			attackName = 'Thorns of Gaia'
			element = 'Earth'
			damage, @lastSpell = mage_dmg_calculation(attackName, @lastSpell)
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		elsif attackChoice == 4
			attackName = 'Fury of Zeus'
			element = 'Air'
			damage, @lastSpell = mage_dmg_calculation(attackName, @lastSpell)
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		end
	end

	def mage_dmg_calculation(attackName, lastSpell)
		@spellCount.each do |spell|
			if attackName == lastSpell && attackName == spell[0]
				@spellCount[attackName] += 4
			elsif attackName != lastSpell
				@spellCount[attackName] = 2
				@lastSpell = attackName
			end

			if @spellCount[attackName] > 14
				@spellCount[attackName] = 2
			end
		end
		return [@spellCount[attackName].to_i, attackName]
	end
	
	def mageUI()
		puts "1.Flames of Vulcan","2.Waves of Neptune", "3.Thorns of Gaia","4.Fury of Zeus"
		if @lastSpell == 'None'
			puts "\n"+ "Spell Flux: #{@lastSpell}"
		else
			puts "\n"+"Spell Flux: #{@lastSpell} - Damage:#{@spellCount[@lastSpell].to_i+4}"
		end
	end
end

class KingsSwordsman < Hero
	attr_accessor :CLASS_NAME
	attr_accessor :maxHealth
	attr_accessor :health
	attr_accessor :moveList
	attr_accessor :focusMoveList
	attr_accessor :focus_state

	def initialize(name)
		super(name)	
		@CLASS_NAME = "Swordsman"
		@focus_state = 0
		@maxHealth = 200
		@health = 200
		@moveList = ['Vertical Strike', 'Steel Bash', 'Wide Swing', 'Inner Focus']
		@focusMoveList = ['Swift Aerial Lunge', 'Dynamite Rock Smash', 'Tidal Pulse Wave']
	end
	
	def choose_attack()
		attackChoice = 0
		#Check for swordsman valid user input
		if @focus_state == 0
			attackChoice = rand(1..4)
		else
			attackChoice = rand(1..3)
		end

		#Swordsman Moves - Focus State:0
		if @focus_state == 0
			if attackChoice == 1
				attackName = 'Vertical Strike'
				element = 'None'
				damage = 5
				puts "#{@name}: #{attackName} has dealt #{damage} damage"
				return attackName, damage
			elsif attackChoice == 2
				attackName = 'Steel Bash'
				element = 'None'
				damage = 3
				puts "#{@name}: #{attackName} has dealt #{damage} damage"
				return attackName, damage
			elsif attackChoice == 3
				attackName = 'Wide Swing'
				element = 'None'
				damage = 6
				puts "#{@name}: #{attackName} has dealt #{damage} damage"
				return attackName, damage
			elsif attackChoice == 4
				attackName = 'Inner Focus'
				element = 'None'
				puts "#{@name} has absorbed the powers of nature"
				damage = 0
				@focus_state = 1
				return attackName, damage
			end
		#Swordsman Moves - Focus State:1
		elsif @focus_state == 1
			if attackChoice == 1
				attackName = 'Swift Aerial Lunge'
				element = 'Air'
				damage = 10
				@focus_state = 0
				puts "#{@name}: #{attackName} has dealt #{damage} damage"
				return attackName, damage
			elsif attackChoice == 2
				attackName = 'Dynamite Rock Smash'
				element = 'Earth'
				damage = 13
				@focus_state = 0
				puts "#{@name}: #{attackName} has dealt #{damage} damage"
				return attackName, damage
			elsif attackChoice == 3
				attackName = 'Tidal Pulse Wave'
				element = 'Water'
				damage = 12
				@focus_state = 0
				puts "#{@name}: #{attackName} has dealt #{damage} damage"
				return attackName, damage
			end
		end
	end
end

class KingsArcher < Hero
	attr_accessor :arrowStack
	attr_accessor :CLASS_NAME
	attr_accessor :maxHealth
	attr_accessor :health
	attr_accessor :moveList
	
	def initialize(name)
		super(name)	
		@CLASS_NAME = "Archer"
		@arrowStack = 0
		@maxHealth = 200
		@health = 200
		@moveList = ['Hailstorm', 'Bow-merang', 'Long Shot', 'Infinity Arrow']
	end	
	
	def choose_attack()
		attackChoice = 0
		#Check for Archer valid user input
		if arrowStack < 10
			attackChoice = rand(1..3)
		else
			attackChoice = rand(1..4)
		end
		
		#Archer Moves
		if attackChoice == 1
			attackName = 'Hailstorm'
			element = 'Ice'
			@arrowStack += 1
			damage = 6
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		elsif attackChoice == 2
			attackName = 'Bow-merang'
			element = 'Air'
			@arrowStack += 3
			damage = 2
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		elsif attackChoice == 3
			attackName = 'Long Shot'
			element = 'Air'
			@arrowStack += 2
			damage = 4
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		end

		if attackChoice == 4 && arrowStack > 10
			attackName = 'Infinity Arrow'
			element = 'All'
			@arrowStack = 0
			damage = 20
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		end
	end
end

class KingsNinja < Hero
	attr_accessor :CLASS_NAME
	attr_accessor :maxHealth
	attr_accessor :health
	attr_accessor :moveList

	def initialize(name)
		super(name)	
		@CLASS_NAME = "Ninja"
		@maxHealth = 150
		@health = 150
		@moveList = ['Ninjitsu: Moonlight', 'Ninjitsu: Assassinate', 'Ninjitsu: Frost Shuriken', 'Ninjitsu: Flame Dragon']
	end

	def choose_attack()
		if @health == 150
			attackChoice = rand(2..4)
		else
			attackChoice = rand(1..4)
		end
		
		#Ninja Moves
		if attackChoice == 1
			attackName = 'Ninjitsu: Moonlight'
			element = 'Life'
			regen = rand(10..25)
			@health += regen
			if @health > @maxHealth
				@health = @maxHealth
			end
			damage = 0
			puts "#{@name}: #{attackName} has healed #{@name} for #{regen}"
			return attackName, damage
		elsif attackChoice == 2
			attackName = 'Ninjitsu: Assassinate'
			element = 'Death'
			willMonsterDie = rand(1..10)
			#willMonsterDie = 5
			if willMonsterDie == 5 #if the Die rolls 5, monster is dead
				damage = 10000
				willMonsterDie == 0
				puts "#{name} has dealt the finishing blow"
				puts "#{@name}: #{attackName} has dealt #{damage} damage"
				return attackName, damage
			else
				damage = 0
				puts "#{@name}: #{attackName} has dealt #{damage} damage"
				return attackName, damage
			end
		elsif attackChoice == 3
			attackName = 'Ninjitsu: Frost Shuriken'
			element = 'Water'
			damageMultiplier = rand(1..4)
			damage = 3 * damageMultiplier
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		elsif attackChoice == 4
			attackName = 'Ninjitsu: Flame Dragon'
			element = 'Fire'
			damage = 8*rand(0..3)
			puts "#{@name}: #{attackName} has dealt #{damage} damage"			
			return attackName, damage
		end
	end
end

class KingsNecromancer < Hero
	attr_accessor :CLASS_NAME
	attr_accessor :maxHealth
	attr_accessor :health
	attr_accessor :moveList

	def initialize(name)
		super(name)	
		@CLASS_NAME = "Necromaner"
		@numOfMinions = 0
		@maxHealth = 150
		@health = 150
		@moveList = ['Undead Burst', 'Life Siphon', 'Call of the Haunted', 'Demented Golem']
	end
	
	def choose_attack()
		attackChoice = rand(1..4)
		#Necromoves
		if attackChoice == 1
			attackName = 'Undead Burst'
			element = 'Fire'
			damage = 3 * @numOfMinions
			@numOfMinions = 0
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		elsif attackChoice == 2
			attackName = 'Life Siphon'
			element = 'Earth'
			damage = rand(1..3) * @numOfMinions + 1
			if @numOfMinions > 0
				@numOfMinions -= 1
			end
			siphonedHealth = rand(damage/3 ..damage)
			@health += siphonedHealth
			if @health > @maxHealth
				@health = @maxHealth
			end
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			puts "#{@name}: #{attackName} has healed #{@name} for #{siphonedHealth}"
			return attackName, damage
		elsif attackChoice == 3
			attackName = 'Call of the Haunted'
			element = 'Earth'
			@numOfMinions += 2
			damage = 3
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		elsif attackChoice == 4
			attackName = 'Demented Golem'
			element = 'Earth'
			@numOfMinions += 1
			damage = 5 + @numOfMinions*1.5
			puts "#{@name}: #{attackName} has dealt #{damage} damage"
			return attackName, damage
		end
	end
end

def decide_champion(currentPartyList)
	traitor = currentPartyList[rand(1...currentPartyList.length)]
	chooseClass = traitor.class.name
	
	if chooseClass == 'Mage'
		champion = KingsMage.new(traitor.name)
		puts "#{traitor.name} the Phantasmal Mage: Now you'll see my magic first hand"
	elsif chooseClass == 'Swordsman'
		champion = KingsSwordsman.new(traitor.name)
		puts "#{traitor.name} the Wandering Swordsman: Prepare to taste my blade"
	elsif chooseClass == 'Archer'
		champion = KingsArcher.new(traitor.name)
		puts "#{traitor.name} the Grand Archer: These eyes have a new target"
	elsif chooseClass == 'Ninja'
		champion = KingsNinja.new(traitor.name)
		puts "#{traitor.name} the Silent Ninja: ...!"
	else
		champion = KingsNecromancer.new(traitor.name)
		puts "#{traitor.name} the Dark Arts Necromancer: Time to make a minion out of you"
	end

	return champion
end