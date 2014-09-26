
class Player 

	def play_turn(warrior)
		space_backward = warrior.feel :backward

		if space_backward.wall? || @reached_to_wall == true
		  @reached_to_wall = true
			if @health.nil? == false && @health > warrior.health
				if warrior.feel.enemy?
					warrior.attack!
				elsif warrior.feel.captive?
					warrior.rescue!
				elsif warrior.health < 15
					warrior.walk! :backward
				else
					warrior.walk!
				end
			else
				if warrior.feel.enemy?
					warrior.attack!
				elsif warrior.health < 20
					warrior.rest!
				elsif warrior.feel.captive?
					warrior.rescue!
				else
					warrior.walk!
				end
			end
		else
			if space_backward.captive?
				warrior.rescue! :backward
			else
				warrior.walk! :backward
			end
		end

		@health = warrior.health
	end
end