require_relative './heroes.rb'
require_relative './enemies.rb'
require_relative './graphics.rb'
require_relative './battle.rb'
require_relative './story.rb'
require_relative './kings_champion.rb'

heroNameList = ['Cyril', 'Bo', 'Tung', 'Danny', 'Kevin', 'Richard']
heroClassList = [Mage, Swordsman, Archer, Ninja, Necromancer]

$currentParty = []
$joeSpared = 9

prelude(heroNameList, heroClassList)

#-----Leave village with companion, fight Goblin in forest
chapter1Decision = chapter1(heroNameList, heroClassList)
#-----Choose path(ally+fight) to Caverns
if chapter1Decision == 1
	chapter2a(heroNameList, heroClassList) #Merman
else
	chapter2b(heroNameList, heroClassList) #Gryphon
end

#-----Caverns
chapter3a(heroNameList, heroClassList) #Joe Sama
chapter3b(heroNameList, heroClassList) #Cave Troll

#Castle
chapter4a() #King's Champion
chapter4b() #Fallen King








