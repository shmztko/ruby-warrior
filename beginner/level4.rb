
class Player 

	def play_turn(warrior)

		if @health.nil? == false && @health > warrior.health
			if warrior.feel.enemy?
				warrior.attack!
			else
				warrior.walk!
			end
		else
			if warrior.feel.enemy?
				warrior.attack!
			elsif warrior.health < 15
				warrior.rest!
			else
				warrior.walk!
			end
		end

		@health = warrior.health
	end
end