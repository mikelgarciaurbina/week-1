require_relative './User.rb'
require_relative './Room.rb'
require_relative './Game.rb'
require 'pry'

rooms = [
	Room.new([0,0], "You are in a room1.", false, ""),
	Room.new([0,1], "You are in a room2.", false, ""),
	Room.new([1,0], "You are in a room2.", false, "Ball"),
	Room.new([0,2], "You are in a room3.", false, ""),
	Room.new([2,0], "You are in a room3.", false, ""),
	Room.new([1,2], "You are in a room4.", false, ""),
	Room.new([2,1], "You are in a room4.", false, ""),
	Room.new([2,2], "You are in a room5.", false, ""),
	Room.new([3,2], "You are in a room6.", false, ""),
	Room.new([4,2], "You are in a room7.", false, ""),
	Room.new([5,2], "You are in a room8.", false, ""),
	Room.new([5,1], "You are in a room9.", false, ""),
	Room.new([5,0], "You are in a last room. You Win!", true, "")
]

puts "Enter your name: "
user_name = gets.chomp

game = Game.new(User.new(user_name, [0,0]), rooms)

actual_room = game.get_actual_room
game.show_room_description(actual_room)

while actual_room.fin == false
	action = gets.chomp
	there_are_room = game.move(action)
	if there_are_room == 1
		puts "Command not allowed."
	elsif there_are_room == 2
		puts "You pick up."
	elsif there_are_room == 3
		puts "Not are object in this room."
	elsif there_are_room == 4
		puts "you drop a object."
	elsif there_are_room == 5
		puts "You do not have any object."
	elsif there_are_room == true
		actual_room = game.get_actual_room
	else
		puts "There is no exit there."
	end
	game.show_room_description(actual_room)
end