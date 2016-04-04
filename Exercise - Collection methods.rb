class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Urtzi's place", "Bilbao", 1, 40),
  Home.new("Victor's place", "Madrid", 3, 50),
  Home.new("Alex's place", "Vigo", 2, 43),
  Home.new("Mikel's place", "Bergara", 6, 60),
  Home.new("Manu's place", "Madrid", 1, 35)
]

def print_menu
	puts "---------- MENU ----------"
	puts "1.- Order by price ascende"
	puts "2.- Order by price descendent"
	puts "3.- Order by capacity ascende"
	puts "4.- Order by capacity descendent"
	puts "5.- Insert city"
	puts "6.- Insert price"
end

def user_input_action(user_action, homes)
	case user_action.to_i
	when 1
		homes = order_by_price_asc(homes)
	when 2
		homes = order_by_price_desc(homes)
	when 3
		homes = order_by_capacity_asc(homes)
	when 4
		homes = order_by_capacity_desc(homes)
	when 5
		homes = insert_city(homes)
	when 6
		homes = find_price(homes)
	end
	print_homes(homes)
end

def print_homes(homes)
	homes.each do |home|
	  puts home.name + " in " + home.city
	  puts "Price: $" + home.price.to_s + " a night"
	  puts "Capacity: " + home.capacity.to_s
	  puts ""
	end
	show_average(homes)
end

def order_by_price_asc(homes)
	homes.sort do |a, b|
		a.price <=> b.price
	end
end

def order_by_price_desc(homes)
	homes.sort do |a, b|
		b.price <=> a.price
	end
end

def order_by_capacity_asc(homes)
	homes.sort do |a, b|
		a.capacity <=> b.capacity
	end
end

def order_by_capacity_desc(homes)
	homes.sort do |a, b|
		b.capacity <=> a.capacity
	end
end

def insert_city(homes)
	puts "\nInsert city name: "
	city = gets.chomp
	select_homes = homes.select do |home|
		home.city == city
	end
	puts ""
	select_homes
end

def show_average(homes)
	if homes.size > 0
		print "Average: "
		puts homes.reduce(0){|sum, homes| sum + homes.price}.to_f / homes.size
		puts ""
	else
		puts "Average: 0"
	end
end

def find_price(homes)
	puts "\nInsert home price: "
	price = gets.chomp.to_i
	find_home = homes.find do |home|
		home.price == price
	end
	puts ""
	if find_home
		[find_home]
	else
		[]
	end
end

print_menu()
user_input = gets.chomp
user_input_action(user_input, homes)
