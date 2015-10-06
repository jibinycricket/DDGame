	def display_hp(charachter)
	eachBar = 5
	fullBars = charachter.health/5
	emptyBars = (charachter.maxHealth - charachter.health)/5
	
	print "#{charachter.name} HP:["
	print '='*fullBars
	print '-'*emptyBars
	puts "][#{charachter.health}/#{charachter.maxHealth}]"
end

def display_movelist(hero)
	if hero.CLASS_NAME == "Swordsman"
		if hero.focus_state == 1
			x = 1
			hero.focusMoveList.each do |move|
				puts "#{x}. #{move}"
				x += 1
			end
			puts "4. Skill Description"
		else
			x = 1
			hero.moveList.each do |move|
				puts "#{x}. #{move}"
				x += 1
			end
			puts "5. Skill Description"
		end
	else
		x = 1
		hero.moveList.each do |move|
			puts "#{x}. #{move}"
			x += 1
		end
		puts "5. Skill Description"
	end
end

def start_battle(hero, enemy)
	heroAttackName = 'None' 
	heroElement = 'None'
	heroDamage = 0
	
	enemyAttackName = 'None'
	enemyWeakness = 'None'
	enemyDamage = 0
	validAttack = false
	while(1)
		display_hp(enemy)
		display_hp(hero)
		
		if hero.CLASS_NAME == 'Mage'
			hero.mageUI
		else
			display_movelist(hero)
		end
		while validAttack == false
			heroAttackName, heroElement, heroDamage = hero.choose_attack()
			if heroAttackName == 'Description'
				$stdin.gets.chomp
				system "clear"
				display_hp(enemy)
				display_hp(hero)
				display_movelist(hero)
				validAttack == false
			else
				validAttack = true
			end
		end
		if heroDamage > 0
		#Hero Attacks w/damage
			if enemy.elementWeakness == heroElement
				heroDamage *= 2
				puts "#{hero.name}: #{heroAttackName} is twice as effective. Hits for #{heroDamage} damage"
				enemy.health -= heroDamage
			else
				puts "#{hero.name}: #{heroAttackName} deals #{heroDamage} damage"
				enemy.health -= heroDamage
			end
		end

		if enemy.health <= 0
			enemy.health = 0
			clear_screen()
			display_hp(enemy)
			display_hp(hero)
			puts "#{enemy.name} has been slain"
			clear_screen
			break
		end

		#Enemy Attacks
		enemyAttackName, enemyDamage = enemy.choose_attack()
		hero.health -= enemyDamage
		if hero.health <= 0
			hero.health = 0
			display_hp(enemy)
			display_hp(hero)
			puts "#{hero.name} has fallen in battle"
			break
		end
		validAttack = false
		clear_screen
	end
	reinitialize_attack_states()
end
	
	
	