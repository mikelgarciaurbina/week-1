class ShoppingCart
  def initialize(items, discounts)
    @items = items
    @discounts = discounts
    @cart = {}
  end

  def add_item_to_cart(item)
      if @cart.key?(item)
        @cart[item] +=1
      else
        @cart[item] = 1
      end
  end

  def show
  	self.show_cart_items
    self.show_total_cost
  end

  def show_cart_items
    @cart.each do |key, value|
      total_price = calculate_total_cost_of_item(key, value)
      puts value.to_s + " " + key.to_s + " " + total_price.to_s
    end
  end

  def show_total_cost
    puts "\nTotal cost: #{self.calculate_total_cost}"
  end

  def calculate_total_cost_of_item(key, value)
    #binding.pry
    day = self.get_date_item(key)
    total_price = @items[key][day].to_i * value.to_i
    self.discount_item(total_price, key, value)
  end

  def calculate_total_cost
    @cart.reduce(0) do |sum, (key, value)|
      total_price = calculate_total_cost_of_item(key, value)
      sum + total_price
    end
  end

  def discount_item(total_price, item, count)
    total_price_discount = total_price
    @discounts.each do |key, value|
      if self.item_has_discount?(item, value, key)
        day = self.get_date_item(item)
        total_price_discount -= @cart[key] / value[:count] * @items[item][day] * value[:many]
      end
    end
    total_price_discount
  end

  def item_has_discount?(item, value, key)
    item.to_s == value[:discount] && @cart.key?(key) && @cart[key] >= value[:count]
  end

  def get_date_item(key)
    Date.today.send(@items[key][:cal_date]).to_sym
  end
end