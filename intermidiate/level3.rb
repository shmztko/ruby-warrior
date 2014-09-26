
class Player
	def play_turn(warrior)
		if warrior.feel(:forward).enemy?
			warrior.bind! :forward
		elsif warrior.feel(:left).enemy?
			warrior.bind! :left
		elsif warrior.feel(:right).enemy?
			warrior.bind! :right
		elsif warrior.feel(:backward).enemy?
			warrior.bind! :backward

		elsif warrior.feel(warrior.direction_of_stairs).captive?
			warrior.attack! warrior.direction_of_stairs
		else
			warrior.walk! warrior.direction_of_stairs
		end
	end
end