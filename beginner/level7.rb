
class Player 

	def play_turn(warrior)
		if @health.nil? == false && @health > warrior.health
			if warrior.feel.enemy?
				warrior.attack!
			elsif warrior.feel.captive?
				warrior.rescue!
			elsif warrior.feel.wall?
				warrior.pivot! :backward
			elsif warrior.health < 15
				warrior.walk! :backward
			else
				warrior.walk!
			end
		else
			if warrior.feel.enemy?
				warrior.attack!
			elsif warrior.feel.wall?
				warrior.pivot! :backward
			elsif warrior.feel.captive?
				warrior.rescue!
			elsif warrior.health < 20
				warrior.rest!
			else
				warrior.walk!
			end
		end
		
		@health = warrior.health
	end
end