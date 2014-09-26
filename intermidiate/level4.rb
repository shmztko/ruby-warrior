
class Player

	def play_turn(warrior)
		init if @initialized.nil?

		captive_spaces = warrior.listen.select {|s| s.captive?}
		captive_space = captive_spaces[0] if captive_spaces.count > 0
		if captive_space.nil?
			enemy_spaces = warrior.listen.select {|s| s.enemy?}
			enemy_space = enemy_spaces[0] if enemy_spaces.count > 0

			direction = warrior.direction_of enemy_space

			if warrior.feel(direction).empty?
				if warrior
				warrior.walk! direction

			elsif warrior.feel(direction).captive?
				warrior.rescue! direction
				@index = @index + 1

			else
				# N/A
			end

		else
			direction = warrior.direction_of captive_space

			if warrior.feel(direction).empty?
				warrior.walk! direction
			elsif warrior.feel(direction).captive?
				warrior.rescue! direction
				@index = @index + 1

			else
				# N/A
			end
		end
	end

	def init
		@initialized = true
		@index = 0
	end
end