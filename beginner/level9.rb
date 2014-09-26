
class Player 

	@backward_ok =  false

	def play_turn(warrior)

		if @backward_ok

			if warrior.feel.empty?
				warrior.walk!

			elsif warrior.feel.enemy?
				warrior.attack!

			elsif warrior.feel.captive?
				warrior.rescue!

			elsif warrior.feel.wall?
				warrior.pivot! :backward

			elsif is_there_enemy?(warrior.look)
				warrior.shoot!

			elsif !@health.nil? && @health > warrior.health
				if warrior.health < 15
					warrior.walk! :backward
				else
					warrior.walk!
				end

			elsif warrior.health < 20
					warrior.rest!
			
			else
				warrior.walk!
			end
		else
			@backward_ok = true
			warrior.pivot! :backward
		end
		
		@health = warrior.health
	end

	def is_there_enemy?(spaces)
		spaces.select { | space |
			space.enemy?
		}.count > 0
	end
end