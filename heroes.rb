class Hero
	attr_accessor :name
	def initialize(name)
		@name = name
	end
end

class Mage < Hero

	attr_accessor :CLASS_NAME
	attr_accessor :maxHealth
	attr_accessor :health
	attr_accessor :moveList
	attr_accessor :lastSpell

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
		while attackChoice > 5 || attackChoice < 1
			print "Select an option[1-5]>:"
			attackChoice = $stdin.gets.chomp.to_i
		end
	
		#Chooses skill(1-4)
		if attackChoice == 1
			attackName = 'Flames of Vulcan'
			element = 'Fire'
			damage, @lastSpell = mage_dmg_calculation(attackName, @lastSpell)
			return attackName, element, damage
		elsif attackChoice == 2
			attackName = 'Waves of Neptune'
			element = 'Water'
			damage, @lastSpell = mage_dmg_calculation(attackName, @lastSpell)
			return attackName, element, damage
		elsif attackChoice == 3
			attackName = 'Thorns of Gaia'
			element = 'Earth'
			damage, @lastSpell = mage_dmg_calculation(attackName, @lastSpell)
			return attackName, element, damage
		elsif attackChoice == 4
			attackName = 'Fury of Zeus'
			element = 'Air'
			damage, @lastSpell = mage_dmg_calculation(attackName, @lastSpell)
			return attackName, element, damage
		elsif attackChoice == 5
			skill_description(@CLASS_NAME)
			return 'Description', 'None', 0
		end

		#while attackChoice = 'x'
			#skill_description()
			#clear_screen
			#display_hp(enemy)
			#display_hp(hero)
			#display_movelist(hero)
			#attackChoice = $stdin.gets.chomp.to_i
		#end
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
		puts "1. Flames of Vulcan","2. Waves of Neptune", "3. Thorns of Gaia","4. Fury of Zeus","5. Skill Description"
		if @lastSpell == 'None'
			puts "\n"+ "Spell Flux: #{@lastSpell}"
		else
			if @spellCount[@lastSpell].to_i+4 == 18
				@lastSpell = 'None'
				puts "\n"+ "Spell Flux: #{@lastSpell}"
			else
				puts "\n"+"Spell Flux: #{@lastSpell} - Damage:#{@spellCount[@lastSpell].to_i+4}"
			end
		end
	end
end

class Swordsman < Hero
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
			while attackChoice > 5 || attackChoice < 1
				print "Select an option[1-5]>:"
				attackChoice = $stdin.gets.chomp.to_i
			end
		else
			while attackChoice > 4 || attackChoice < 1
				print "Select an option[1-4]>:"
				attackChoice = $stdin.gets.chomp.to_i
			end			
		end
		#Swordsman Moves - Focus State:0
		if @focus_state == 0
			if attackChoice == 1
				attackName = 'Vertical Strike'
				element = 'None'
				damage = 5
				return attackName, element, damage
			elsif attackChoice == 2
				attackName = 'Steel Bash'
				element = 'None'
				damage = 3
				return attackName, element, damage
			elsif attackChoice == 3
				attackName = 'Wide Swing'
				element = 'None'
				damage = 6
				return attackName, element, damage
			elsif attackChoice == 4
				attackName = 'Inner Focus'
				element = 'None'
				puts "#{@name} has absorbed the powers of nature"
				damage = 0
				@focus_state = 1
				return attackName, element, damage
			elsif attackChoice == 5
				skill_description(@CLASS_NAME)
				return 'Description', 'None', 0
			end
		#Swordsman Moves - Focus State:1
		elsif @focus_state == 1
			if attackChoice == 1
				attackName = 'Swift Aerial Lunge'
				element = 'Air'
				damage = 15
				@focus_state = 0
				return attackName, element, damage
			elsif attackChoice == 2
				attackName = 'Dynamite Rock Smash'
				element = 'Earth'
				damage = 20
				@focus_state = 0
				return attackName, element, damage
			elsif attackChoice == 3
				attackName = 'Tidal Pulse Wave'
				element = 'Water'
				damage = 12
				@focus_state = 0
				return attackName, element, damage
			elsif attackChoice == 4	
				skill_description(@CLASS_NAME)
				return 'Description', 'None', 0
			end
		end
	end
end

class Archer < Hero
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
		@moveList = ['Hailstorm', 'Bow-merang', 'Cross Fire', 'Infinity Arrow']
	end	
	
	def choose_attack()
		puts "ARROW STACK: #{arrowStack}"
		attackChoice = 0
		#Check for Archer valid user input
		while attackChoice > 5 || attackChoice < 1
			print "Select an option[1-4]>:"
			attackChoice = $stdin.gets.chomp.to_i
		end
		
		while attackChoice == 4 && arrowStack < 10
			puts "Cannot use Infinity Arrow. Requires Arrow Stack of 10"
			puts "ArrowStacks: #{arrowStack}"
			puts "You don't have enough stacks(1-3)"
			prompt
			attackChoice = $stdin.gets.chomp.to_i
			while attackChoice > 3 || attackChoice < 1
				prompt
				attackChoice = $stdin.gets.chomp.to_i
			end
		end
		
		#Archer Moves
		if attackChoice == 1
			attackName = 'Hailstorm'
			element = 'Water'
			@arrowStack += 1
			damage = 12
			return attackName, element, damage
		elsif attackChoice == 2
			attackName = 'Bow-merang'
			element = 'Air'
			@arrowStack += 3
			damage = 4
			return attackName, element, damage
		elsif attackChoice == 3
			attackName = 'Cross Fire'
			element = 'Fire'
			@arrowStack += 2
			damage = 8
			return attackName, element, damage
		elsif attackChoice == 5
			skill_description(@CLASS_NAME)
			return 'Description', 'None', 0
		end

		if attackChoice == 4
			attackName = 'Infinity Arrow'
			element = 'All'
			@arrowStack -= 15
			damage = 50
			return attackName, element, damage
		end
	end
end

class Ninja < Hero
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
		attackChoice = 0
		#Check for Ninja valid user input
		while attackChoice > 5 || attackChoice < 1
			print "Select an option[1-5]>:"
			attackChoice = $stdin.gets.chomp.to_i
		end
		
		while attackChoice == 1 && @health == 150
			puts 'Already Max HP, Enter another option'
			prompt
			attackChoice = $stdin.gets.chomp.to_i
			while attackChoice > 4 || attackChoice < 1
				attackChoice = $stdin.gets.chomp.to_i
			end
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
			return attackName, element, damage
		elsif attackChoice == 2
			attackName = 'Ninjitsu: Assassinate'
			element = 'Death'
			willMonsterDie = rand(1..10)
			#willMonsterDie = 5
			if willMonsterDie == 5 #if the Die rolls 5, monster is dead
				damage = 10000
				willMonsterDie == 0
				puts "#{name} has dealt the finishing blow"
				return attackName, element, damage
			else
				damage = 0
				puts "#{@name}: #{attackName} has dealt #{damage} damage"
				return attackName, element, damage
			end
		elsif attackChoice == 3
			attackName = 'Ninjitsu: Frost Shuriken'
			element = 'Water'
			damageMultiplier = rand(2..4)
			damage = 3 * damageMultiplier
			return attackName, element, damage
		elsif attackChoice == 4
			attackName = 'Ninjitsu: Flame Dragon'
			element = 'Fire'
			damage = 8*rand(0..3)
			return attackName, element, damage
		elsif attackChoice == 5
			skill_description(@CLASS_NAME)
			return 'Description', 'None', 0
		end
	end
end

class Necromancer < Hero
	attr_accessor :CLASS_NAME
	attr_accessor :maxHealth
	attr_accessor :health
	attr_accessor :moveList
	attr_accessor :numOfMinions

	def initialize(name)
		super(name)	
		@CLASS_NAME = "Necromancer"
		@numOfMinions = 0
		@maxHealth = 150
		@health = 150
		@moveList = ['Undead Burst', 'Life Siphon', 'Call of the Haunted', 'Demented Golem']
	end
	
	def choose_attack()
		puts "MINION COUNT: #{numOfMinions}"
		attackChoice = 0
		#Check for Necromancer valid user input
		while attackChoice > 5 || attackChoice < 1
			print "Select an option[1-5]>:"
			attackChoice = $stdin.gets.chomp.to_i
		end
		
		#Necromoves
		if attackChoice == 1
			attackName = 'Undead Burst'
			element = 'Fire'
			damage = (3 * @numOfMinions) + 1
			@numOfMinions = 0
			return attackName, element, damage
		elsif attackChoice == 2
			attackName = 'Life Siphon'
			element = 'Earth'
			damage = rand(1..3) * @numOfMinions/2 + 1
			if @numOfMinions > 0
				@numOfMinions -= 1
			end
			siphonedHealth = rand(damage/3 ..damage)
			@health += siphonedHealth
			if @health > @maxHealth
				@health = @maxHealth
			end
			puts "#{attackName} has healed #{@name} for #{siphonedHealth}"
			return attackName, element, damage
		elsif attackChoice == 3
			attackName = 'Call of the Haunted'
			element = 'Earth'
			@numOfMinions += 2
			damage = 3
			return attackName, element, damage
		elsif attackChoice == 4
			attackName = 'Demented Golem'
			element = 'Earth'
			@numOfMinions += 1
			damage = 5 + @numOfMinions*1.5
			return attackName, element, damage
		elsif attackChoice == 5
			skill_description(@CLASS_NAME)
			return 'Description', 'None', 0
		end
	end
end

def create_companion(nameList, classList)
	chooseName = nameList[rand(0...nameList.length)]
	chooseClass = classList[rand(0...classList.length)]	

	if chooseClass == Mage
		newHero = Mage.new(chooseName)
		puts "#{chooseName} the Phantasmal Mage: It seems you could use a bit of magic on your side."
	elsif chooseClass == Swordsman
		newHero = Swordsman.new(chooseName)
		puts "#{chooseName} the Wandering Swordsman: My blade will lend you aid in your quest."
	elsif chooseClass == Archer
		newHero = Archer.new(chooseName)
		puts "#{chooseName} the Grand Archer: My eyes are like a hawk, you can't hide from em."
	elsif chooseClass == Ninja
		newHero = Ninja.new(chooseName)
		puts "#{chooseName} the Gambling Ninja: Luck is always on my side, you might need some."
	else
		newHero = Necromancer.new(chooseName)
		puts "#{chooseName} the Dark Arts Necromancer: My minions and I will trample your enemies."
	end

	nameList.delete(chooseName)
	classList.delete(chooseClass)

	return newHero, nameList, classList
end

def create_player(nameList, classList)
	puts "Chief Wimwam: Hello stranger, are you the one we called for?"
	puts "Chief Wimwam: What is your name hero?"
	print "Enter Name:>"
	player = $stdin.gets.chomp.capitalize
	clear_screen
	puts "\nChief Wimwam: #{player}! What a splendid name for a hero \n"
	puts "Chief Wimwam: What is that you carry with you?\n1.Staff\n2.Swords\n3.Long Bow\n4.Shurikens\n5.Dark Tome"
	weaponChoice = 0
	
	while weaponChoice < 1 || weaponChoice > 5
		print "Choose Weapon:>"
		weaponChoice = $stdin.gets.chomp.to_i
		puts "\n"
	end

	case weaponChoice
	when 1
		puts "Chief Wimwam: Oh so you are an all powerful mage."
		chosenClass = Mage
	when 2
		puts "Chief Wimwam: Oh so you are a wandering swordsman."
		chosenClass = Swordsman
	when 3
		puts "Chief Wimwam: A valiant archer, I see."
		chosenClass = Archer
	when 4
		puts "Chief Wimwam: A highly skilled ninja? We definetely need one."
		chosenClass = Ninja
	when 5
		puts "Chief Wimwam: Necromancer? We don't favor the dark arts, but that just might be what we need"
		chosenClass = Necromancer
	end

	if nameList.include? player
		nameList.delete(player)
		classList.delete(chosenClass)
	else
		classList.delete(chosenClass)
	end

	newPlayer = chosenClass.new(player)
	return newPlayer, nameList, classList
end

def reinitialize_attack_states()
	$currentParty.each do |charachter|
		case charachter.CLASS_NAME
		when 'Mage'
			charachter.lastSpell = 'None'
		when 'Swordsman'
			charachter.focus_state = 0
		when 'Archer'
			charachter.arrowStack = 0
		when 'Necromancer'
			charachter.numOfMinions = 0
		end
	end
end

def skill_description(className)
	case className
	when 'Mage'
		puts "\n"
		spacer
		puts "Passive - Spell Flux: +4 damage for using the same skill in a row(caps at 3 stacks)"
		puts "\n"
		puts "NAME            	ELEMENT      DAMAGE	DESCRIPTION"
		puts "Flames of Vulcan        - FIRE		2	Unleashes inferno of heat"
		puts "Waves of Neptune        - WATER		2	Releases a barrage of deadly tides"
		puts "Thorns of Gaia     	- EARTH		2	Ensnares enemy in a thorny embrace"
		puts "Fury of Zeus 		- AIR		2	Sends a deadly shock of lightning"
		spacer
		puts "\n"
	when 'Swordsman'
		puts "\n"
		spacer
		puts "Passive - Warrior's Focus: After using Inner Focus, all other skills gain an elemental attribute as well as \nincrease base damage"
		puts "\n"
		puts "NAME               	ELEMENT  	DAMAGE		DESCRIPTION"
		puts "Vertical Strike    	-NONE    	  6		Strong downward attack"
		puts "Steel Bash         	-NONE    	  3		Pummels an enemy"
		puts "Wide Swing         	-NONE    	  8		Horizontal swing"
		puts "Inner Focus        	-NONE    	  0		Channels the energy of nature"
		puts "\n"
		puts "WARRIOR'S FOCUS"		
		puts "Swift Aerial Strike	-AIR 	 	  15		Uses the power of wind to cut down foes"
		puts "Dynamite Rock Smash	-EARTH 	 	  20		Uses the power of earth to shatter the enemy"	
		puts "Tidal Pulse Wave      	-WATER   	  12    	Uses the power of water to knock em down"
		spacer
		puts "\n"
	when 'Archer'
		puts "\n"
		spacer
		puts "Passive - Bowman's Collection: The archer collects stacks of arrows on attack. Unlocks Infinity Arrow at 15 stacks"
		puts "\n"
		puts "NAME               	ELEMENT  	DAMAGE	STACKS	DESCRIPTION"
		puts "Hailstorm		-WATER		  12	 1	Rains a shower of chilling arrows"			
		puts "Bow-merang		-AIR		  4	 3	Sends bow flying"
		puts "Cross Fire		-FIRE		  8	 2	Sends a molten shot"
		puts "Infinity Arrow		-NONE		  50		The ultimate skill of an archer "
		spacer
		puts "\n"
	when 'Ninja'
		puts "\n"
		spacer
		puts "Passive - Gamblers Luck: All abilities have a chance of being something really good or really bad"
		puts "\n"
		puts "NAME				ELEMENT	  DAMAGE	DESCRIPTION"
		puts "Ninjitsu: Moonlight		-NONE 	     0		Uses Moonlight to heal 10-25 damage"
		puts "Ninjitsu: Assassinate		-NONE 	   DEATH 	Has a chance to rain death on the enemy"
		puts "Ninjitsu: Frost Shurikens 	-WATER	   6-12 	Shoots chilling shurikens"
		puts "Ninjitsu Flame Dragon		-FIRE 	   0-24		Use energy to summon dragon breath"
		spacer
		puts "\n"
	when 'Necromancer'
		puts "\n"
		spacer
		puts "Passive - Dark Invocation: Abilities scale off of the number of minions active"
		puts "\n"
		puts "NAME			ELEMENT		DAMAGE		MINIONS		DESCRIPTION"
		puts "Undead Burst		-FIRE		  1		  0		Burst all minions for immense damage"
		puts "Life Siphon		-EARTH		  3		  0		Steal life from enemy"
		puts "Call of the Haunted	-EARTH		  2		 +2		Raise the dead to attack"
		puts "Demented Golem		-EARTH		  6.5		 +1		Summon a colossal swamp golem"
		spacer
		puts "\n"
	end
end