def prelude(nameList, classList)
	puts spacer
	puts "		The Journey Begins					"
	puts spacer
	puts "Narrator: A great evil has haunted these lands for many centuries. You've been called by the village's high chieftain 'Chief Wimwam' to to investigate.\n
You see Chief Wimwam and the villagers behind him.\n", prompt
	player, heroNameList, heroClassList = create_player(nameList,classList)
	$currentParty.push(player)
	clear_screen
	puts "Chief Wimwam: Well #{player.name}, we've had problems with the monsters around these parts, but it seems things are getting worse.", prompt
	puts "Chief Wimwam: The evil seems to be coming from the castle beyond the mountains.", prompt
	puts "Chief Wimwam: We need you to purge the castle, or I fear we might be next.", prompt
	puts "#{player.name}: Don't worry I'll take care of it easily!"
	puts "Narrator: #{player.name} is very full of himself."
	clear_screen
	puts "Narrator: With his weapon in hand and high spirits #{player.name} ventures forth to complete his quest."
	clear_screen

end

def chapter1(nameList, classList)
	puts spacer
	puts "		Dark Woods"
	puts spacer
	puts "Narrator: #{$currentParty[0].name} journeys into the dark woods. He can feel the evil grow stronger as he goes deeper into the woods.", prompt
	puts "*rustle *rustle", prompt
	puts "Narrator: #{$currentParty[0].name} hears something in the bushes.", prompt
	puts "Narrator: Without delay #{$currentParty[0].name} charges at the bushes and to his surprise it wasn't who he was expecting."
	clear_screen
	puts "????: You wouldnt leave without your good buddy would ya?"
	chapter1Companion, heroNameList, heroClassList = create_companion(nameList,classList)
	$currentParty.push(chapter1Companion)
	clear_screen
	puts "Narrator: Seems #{chapter1Companion.name} from your hometown wants to help out"
	puts "#{chapter1Companion.name} the #{chapter1Companion.CLASS_NAME} has joined your party"
	clear_screen()
	puts "*rustle *rustle", prompt
	puts "#{chapter1Companion.name}: That wasn't me this time, I swear.", prompt
	puts "Crazy Goblin: GWAH! It's dinner time, brother", prompt
	puts "#{chapter1Companion.name}: Goblins!", prompt
	puts "#{$currentParty[0].name}: Get ready #{chapter1Companion.name}.", prompt
	clear_screen
	puts "Narrator: Let's have a quick run down on fighting basics\n
1.Every charachter has a set of skills with a unique passive, press the description button for info\n
2.Many enemys have a weakness to a certain element: Air > Earth > Water > Fire > Air\n
Now that, thats covered. Fight!"
	clear_screen
	enemy1 = Goblin.new('Crazy Goblin')
	enemy2 = Goblin.new('Manic Goblin')

	start_battle($currentParty[0], enemy1)

	puts "Manic Goblin: Brother noooooo!"
	puts "Manic Goblin: You'll pay for that"
	prompt
	start_battle(chapter1Companion, enemy2)

	puts "#{$currentParty[0].name}: Let's get out of here before any more of them show up."
	prompt
	puts "#{chapter1Companion.name}: Will we take the river down or take a shortcut through the mountains?"
	prompt
	puts "Narrator: Which path will our hero take?"
	chapter2Route = 0
	while chapter2Route > 2 || chapter2Route < 1
		print "Enter 1(River) or 2(Mountain):"
		chapter2Route = $stdin.gets.chomp.to_i
	end
	if chapter2Route == 1
		puts "#{$currentParty[0].name}: We'll take the boat, and cross the river."
		clear_screen
		return 1
	else
		puts "#{$currentParty[0].name}: We'll take the shortcut through the mountains."
		clear_screen
		return 2
	end
end

def chapter2a(nameList, classList)
	puts spacer
	puts "	Across the Dead River"
	puts spacer
	puts "Narrator: #{$currentParty[0].name} reaches the pier where, he runs into the captain of the boat.", prompt
	puts "#{$currentParty[0].name}: Hello Sir, we could use some assistance across the river.", prompt
	puts "???: I haven't had business in weeks cause of all this darkness nonsense.", prompt
	puts "#{$currentParty[1].name}: We're actually here just for that, we need to cross this river to get to the castle.", prompt
	puts "#{$currentParty[0].name}: I'm going to take out the source of the trouble.", prompt
	puts "???: If that's the case let me join you then.", prompt

	chapter2aCompanion, heroNameList, heroClassList = create_companion(nameList,classList)
	$currentParty.push(chapter2aCompanion)
	puts "#{chapter2aCompanion.name} the #{chapter2aCompanion.CLASS_NAME} has joined your party"
	clear_screen()
	puts "#{chapter2aCompanion.name}: I maybe a poor fisherman, but I'm also one of the finest #{chapter2aCompanion.CLASS_NAME}s in these lands", prompt
	puts "#{chapter2aCompanion.name}: Let's get going, but be warned. Danger lurks in these waters", prompt
	puts "#{$currentParty[1].name}: Danger seems to be lurking everywhere"
	clear_screen
	puts "Narrator: As the heroes cross the river, #{$currentParty[1].name} sees two figures approaching in the water.", prompt
	puts "#{$currentParty[1].name}: There's something below us!"
	clear_screen
	puts "Narrator: Two fishlike beings holding barbed tridents leap menacingly onto the deck."
	prompt
	puts "Royal Merman: These are our waters, humans!"
	puts "Armored Merman: Time to pay for your mistake!"
	prompt
	puts "#{chapter2aCompanion.name}: Time to show you what I can do."
	clear_screen
	enemy1 = Merman.new('Royal Merman')
	enemy2 = Merman.new('Armored Merman')

	start_battle(chapter2aCompanion, enemy2)
	puts "Royal Merman: Gah, he was the weaker one of us. I'm alot stronger"
	start_battle($currentParty[0], enemy1)

	puts "#{$currentParty[0].name}: Not too bad for a fisherman", prompt
	puts "#{$currentParty[0].name}: It's gonna get alot harder from here thats for sure."
	clear_screen

	puts "Narrator: Our heroes reached the shore, and have come across an ancient city, lost to the wrath of time."
	clear_screen
end


def chapter2b(nameList, classList)
	puts spacer
	puts "	The Endless Climb"
	puts spacer
	puts "Narrator: #{$currentParty[0].name} and his companions have been climbing for what seems to be ages.", prompt
	puts "Narrator: The sun scorching down on the rocky trail, with vultures flying above, waiting for a mistep from our heroes."
	clear_screen

	puts "#{$currentParty[0].name}: Whoever said this was a shortcut, was a dirty liar.", prompt
	puts "#{$currentParty[0].name}: I think I see someone up ahead.", prompt
	puts "???: I'm pretty sure they're around here somewhere.", prompt
	puts "#{$currentParty[1].name}: Hey we're trying to get to the other side of this mountain, can you help us?", prompt
	puts "???: Oh you must be the ones the chief sent out. I've been looking for you for hours.", prompt
	puts "???: The Chief thought you could use my help. It's like a maze in here.", prompt
	chapter2bCompanion, heroNameList, heroClassList = create_companion(nameList,classList)
	$currentParty.push(chapter2bCompanion)
	puts "#{chapter2bCompanion.name} the #{chapter2bCompanion.CLASS_NAME} has joined your party", prompt
	puts "#{chapter2bCompanion.name}: The way out is right around this corner"
	clear_screen
	puts "Narrator: As our heroes near the end of the trail, two shadowy figures swoop in from above.", prompt
	puts "#{chapter2bCompanion.name}: GRYPHONS!!", prompt
	puts "#{$currentParty[0].name}: Looks like we're in for a fight"
	clear_screen
	enemy1 = Gryphons.new('Silver Gryphon')
	enemy2 = Gryphons.new('Black Beak Gryphon')

	puts "#{enemy1.name}: This is our mountain, prepare for trouble", prompt
	puts "#{enemy2.name}: Make it double!"
	clear_screen

	start_battle($currentParty[0], enemy1)
	clear_screen

	puts "#{enemy2.name}: He was the weaker of us. Time for a real challenge"
	start_battle(chapter2bCompanion, enemy2)
	
	clear_screen



end

def chapter3a(nameList, classList)
	puts spacer
	puts "	Ancient City of MoleOsus"
	puts spacer
	puts "Narrator: #{$currentParty[0].name} and friends arrive at the lost city of MoleOsus.",prompt
	puts "Narrator: It is said that this was home to a lost civilization of Mole-like creatures.",prompt
	puts "Narrator: Noone knows what the Molemen look like, but it was told they were masters of magic\nand were gentle at heart. All that remains of their time is rubble and ruins.", prompt
	clear_screen
	puts "#{$currentParty[0].name}: It's pretty quiet here, but it seems this place is infested by darkness.",prompt
	puts "???: Who goes there?!",prompt
	puts "Narrator: A hooded figure emerges from the ruins.",prompt
	puts "???: Are you the Fallen King's friend or foe?", prompt
	puts "#{$currentParty[0].name}: Oh the Fallen King, that must be who's behind all this.",prompt
	puts "#{$currentParty[2].name}: We're here to take down the king.",prompt
	puts "???: Well then, it seems we have a common enemy.",prompt
	clear_screen
	chapter3aCompanion, heroNameList, heroClassList = create_companion(nameList,classList)
	$currentParty.push(chapter3aCompanion)
	puts "#{chapter3aCompanion.name} the #{chapter3aCompanion.CLASS_NAME} has joined your party"
	clear_screen()
	puts "#{chapter3aCompanion.name}: Come friends, the kings castle is just beyond the Crystal Caverns.",prompt
	puts "#{chapter3aCompanion.name}: My partner has gone to scount ahead.", prompt
	puts "Narrator: Just as #{$currentParty[0].name} and company were about to leave, a strange creature appears before them.",prompt
	puts "Narrator: A grossily figured being, with sharp claws and razor teeth, stares at them with its beady devilish eyes.",prompt
	puts "Narrator: It flays violently and tries to speak to you in its horrid language.",prompt
	puts "???: ˙ɹoʌıʌɹns ʇsɐן ǝɥʇ 'snso-ǝןoɯ ɟo ƃuıʞ 'ɐɯɐs-ǝoɾ ɯɐ ı ˙sʍǝu pooƃ ƃuıɹq ı 'doʇs 'spuǝıɹɟ ʇıɐʍ",prompt
	puts "???: ı ʍɐuʇ ʇo ƃıʌǝ ʎon ʇɥǝ ןɐsʇ ɹǝɯɐıuıuƃ' ɐɹʇıɟɐɔʇ ʇɥɐʇ ʍıןן ɥǝןd ʎon ɹıp ʇɥıs ǝʌıן ʇɥɐʇ dןɐƃnǝ ʇɥǝsǝ ןɐups˙"
	clear_screen()
	puts "#{chapter3aCompanion.name}: It looks like a creature sent by the Fallen King to stop us, but there's something strange about it"
	puts "#{chapter3aCompanion.name}: What do you want me to do?"
	chapter3aChoice = 3
	while chapter3aChoice > 2 || chapter3aChoice < 1
		print "Enter 1(Kill the creature) or 2(Spare life):"
		chapter3aChoice = $stdin.gets.chomp.to_i
	end
	if chapter3aChoice == 1
		puts "#{$currentParty[0].name}: Kill the creature before it hurts anyone"
		puts "???: uɐuı¿"
		enemy1 = JoeMole.new('ʞıuƃ ɯoןǝ ʇɥǝ sɐɯɐ ɾoǝ')
		clear_screen
		start_battle(chapter3aCompanion, enemy1)
		$joeSpared = 0
	else
		clear_screen
		puts "Narrator: #{$currentParty[0].name} pulls out his weapon in an attempt to scare the creature."
		puts "#{$currentParty[0].name}: Leave before I change my mind beast"
		$joeSpared = 1
	end

	if $joeSpared == 1
		puts "Narrator: With the beast spared the heroes head towards the Crystal Caverns to meet up with #{chapter3aCompanion.name}'s companion."
	else
		puts "Narrator: With the beast defeated the heroes head towards the Crystal Caverns to meet up with #{chapter3aCompanion.name}'s companion."
	end

	clear_screen
end

def chapter3b(nameList, classList)
	puts spacer
	puts "		Crystal Caverns"
	puts spacer
	prompt
	puts "Narrator: The Cavern is lined with magnificent crystals, and could feel the mysticism in each one.", prompt
	puts "Narrator: The heroes hear clashing within the caves and a loud monstrous roar.", prompt
	puts "#{$currentParty[3].name}: Quickly, my friend's in danger.", prompt
	clear_screen
	puts "Narrator: Within the caverns they saw the monstrous beast, towering over them, a golem made of metal and fire.", prompt
	puts "???: Hey guys, so I might have woken him up.", prompt
	puts "???: Don't worry though, I got this under control.",prompt
	chapter3bCompanion, heroNameList, heroClassList = create_companion(nameList,classList)
	$currentParty.push(chapter3bCompanion)
	puts "#{chapter3bCompanion.name} the #{chapter3bCompanion.CLASS_NAME} has joined your party."
	clear_screen()
	enemy1 = MagmaGiant.new('Awoken Magma Giant')
	start_battle(chapter3bCompanion, enemy1)
	backup = 0
	while enemy1.health > 0
		puts "#{$currentParty[backup].name}: Don't worry I got this"
		clear_screen
		start_battle($currentParty[backup], enemy1)
		backup+=1
	end
	puts "#{chapter3bCompanion.name}: See no problem at all",prompt
	puts "#{chapter3bCompanion.name}: The castle doors are just beyond this passage, and inside, the throne room.",prompt
	puts "#{chapter3bCompanion.name}: But first, use these crystals to heal up. I'm sure the journey here took its toll.",prompt

	$currentParty.each do |x|
		x.health = x.maxHealth
	end

	puts "Your Party as been healed."
	clear_screen
end

def chapter4a()
	puts spacer
	puts "		Open the Gates"
	puts spacer
	puts "Narrator: The heroes pass the bridge and stand before the ghastly castle.",prompt
	puts "Narrator: #{$currentParty[0].name} with no way of getting inside, decides to knock on the door.",prompt
	puts "Narrator: An ominous laugh echos through the castle, and sends a chilling rush of wind.",prompt
	puts "???: Muahahahahaha",prompt
	puts "#{$currentParty[0].name}: Open the door, coward!"
	clear_screen
	puts "???: I'll let you in as soon as you prove you are worthy. Defeat my champion and I'll gladly let you in.",prompt
	puts "#{$currentParty[0].name}: That's fine by me, send him out here.",prompt
	puts "???: Oh but he is, he's closer than you think",prompt

	kingsChampion = decide_champion($currentParty)
	prompt

	puts "Narrator: #{$currentParty[0].name} turns to see #{kingsChampion.name} with an aura of darkness"
	clear_screen
	puts "Evil #{kingsChampion.name}: Prepare yourself"
	
	$currentParty.each do |challenger|
		if challenger.name != kingsChampion.name and challenger.name != $currentParty[0].name
			puts "#{challenger.name}: I got this"
			clear_screen
			start_battle(challenger, kingsChampion)
			if kingsChampion.health <= 0
				break
			end
		end
	end

	puts "???: So it seems you have defeated my champion", prompt
	puts "???: Very well, I'll defeat you and make you my slaves", prompt
	
	puts "Narrator: The doors slowly creep open, and our heroes cautiously enter"
	clear_screen
end

def chapter4b()
	puts spacer
	puts "	Fear the Death King"
	puts spacer
	puts "Narrator: A lone figure sits upon a massive throne. A figure fitted in red armor, whos body has rotted away, excuding a ghostly red mist",prompt
	puts "???: Welcome to my castle, I am the Death King, King Yamses!",prompt
	puts "Fallen King Yamses: You're journey will have been for nothing. Behold my power. Muahahaha",prompt
	clear_screen
	fallenKingYam = FallenKing.new('Fallen King Yamses')
	start_battle($currentParty[0], fallenKingYam)
	while $currentParty[0].health >= 0
		if $currentParty[0].health == 0 && $joeSpared == 1
			clear_screen
			puts "Fallen King Yamses: It seems you have fallen and can't get up",prompt
			puts "Fallen King Yamses: It seems you're weaker than I thought. I could use more servants in the castle.",prompt
			puts "Narrator: Just as King Yamses was about to cast his spell on our heroes, a surprise guest has appeared",prompt
			puts "'ʞıuƃ ɯoןǝ ʇɥǝ sɐɯɐ ɾoǝ': ¡ɟɐsʇ so uoʇ",prompt
			puts "Fallen King Yamses: What? What are you doing here?!",prompt
			puts "Narrator: The creature from Mole-Osus starts glowing, and his claws and fangs have been replaced by paws and buckteeth",prompt
			puts "Joe-sama the Mole King: Hello mina san! Yamses had turned me into that monster and I couldnt speak.",prompt
			puts "Joe-sama the Mole King: But I've undone the spell!",prompt
			puts "Joe-sama the Mole King: Thank you #{$currentParty[0].name} for sparing my life",prompt
			puts "Joe-sama the Mole King: Now take this Power Gem, my people have been holding onto this artifact for centuries."
			puts "Joe-sama the Mole King: We have waited on a hero take down this monster, and now you're here", prompt
			$currentParty[0].health = $currentParty[0].maxHealth
			puts "Joe-sama has brought #{$currentParty[0].name} back to fighting strength"
			clear_screen

			puts "Fallen King Yamses: You'll pay for your interference, nevertheless I'll just take you down again"
			clear_screen
			start_battle($currentParty[0], fallenKingYam)
		elsif $currentParty[0].health == 0
			puts "You're journey has ended in failure. The world has been cast into darkness.",prompt
			exit(0)
		else
			puts "Narrator: And with that King Yamses was defeated and the veil of darkness was lifted from the world.",prompt
			exit(0)
		end
	end
end

