
class Player 

	def play_turn(warrior)
		if warrior.feel.enemy?
			warrior.attack!

		elsif is_there_enemy?(warrior.look)
			warrior.shoot!

		elsif warrior.feel.captive?
			warrior.rescue!

		elsif warrior.feel.wall?
			warrior.pivot! :backward

		elsif !@health.nil? && @health > warrior.health
			if warrior.health < 15
				warrior.walk! :backward
			else
				warrior.walk!
			end

		elsif warrior.health < 20
				warrior.rest!
		
		elsif warrior.feel.empty?
			warrior.walk!

		else
			warrior.walk!
		end
		
		@health = warrior.health
	end

	def is_there_enemy?(spaces)
		spaces.select { | space |
			space.enemy?
		}.count > 0
	end
end