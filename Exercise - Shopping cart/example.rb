require_relative './ShoppingCart.rb'
require_relative './DateSeason.rb'
require 'pry'

items = {
	:apple      => {
		:cal_date	=> "season",
		:spring 	=> 10,
		:summer 	=> 10,
		:autumn 	=> 15,
		:winter 	=> 12
	},
	:orange      => {
		:cal_date	=> "season",
		:spring 	=> 5,
		:summer 	=> 2,
		:autumn 	=> 5,
		:winter 	=> 5
	},
	:grape      => {
		:cal_date	=> "season",
		:spring 	=> 15,
		:summer 	=> 15,
		:autumn 	=> 15,
		:winter 	=> 15
	},
	:banana      => {
		:cal_date	=> "season",
		:spring 	=> 20,
		:summer 	=> 20,
		:autumn 	=> 20,
		:winter 	=> 21
	},
	:watermelon => {
		:cal_date	=> "dayname",
		:Sunday 	=> 100,
		:Monday 	=> 50,
		:Tuesday 	=> 50,
		:Wednesday 	=> 50,
		:Thursday 	=> 50,
		:Friday 	=> 50,
		:Saturday 	=> 50,
	}
}

discount = {
	:apple		=> {
		:count 		=> 2,
		:discount 	=> "apple",
		:many		=> 1
	},
	:orange		=> {
		:count 		=> 3,
		:discount 	=> "orange",
		:many		=> 1
	},
	:grape		=> {
		:count 		=> 4,
		:discount 	=> "banana",
		:many		=> 1
	}
}

cart = ShoppingCart.new items, discount

cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :watermelon

cart.show