class Game
  def initialize(player, rooms)
    @player = player
    @rooms = rooms
  end

  def get_actual_room
  	actual_room = ""
  	@rooms.each do |room|
  		if @player.position[0] == room.position[0] && @player.position[1] == room.position[1]
  			actual_room = room
  		end
  	end
  	actual_room
  end

  def show_room_description(room)
  	print room.text
  	if room.object != ""
  		print " There is a " + room.object
  	end
  	puts ""
  end

  def move(direction)
  	there_are_room = false
  	case direction
		when "N"
			there_are_room = self.move_player(0, 1)
		when "S"
			there_are_room = self.move_player(0, -1)
		when "W"
			there_are_room = self.move_player(1, 0)
		when "E"
			there_are_room = self.move_player(-1, 0)
		when "GET"
			user_get = user_get_object
			(user_get) ? there_are_room = 2 : there_are_room = 3
		when "DROP"
			user_drop = user_drop_object
			(user_drop) ? there_are_room = 4 : there_are_room = 5
		else
		  there_are_room = 1
		end
		there_are_room
  end

  def move_player(position1, position2)
  	there_are_room = false
		@rooms.each do |room|
  		if room.check_position?([@player.position[0] + position1, @player.position[1] + position2])
  			there_are_room = true
  		end
  	end
  	if there_are_room
  		@player.position[0] += position1
  		@player.position[1] += position2
  	end
  	there_are_room
  end

  def user_get_object
  	actual_room = get_actual_room
  	are_object = false
  	if actual_room.object != ""
	  	@player.add_object(actual_room.object)
	  	actual_room.delete_object
	  	are_object = true
	  else
	  	are_object = false
	  end
	  are_object
  end

  def user_drop_object
  	actual_room = get_actual_room
  	are_object = false
  	if @player.object != ""
	  	actual_room.object = @player.object
	  	@player.object = ""
	  	are_object = true
	  else
	  	are_object = false
	  end
	  are_object
  end
end