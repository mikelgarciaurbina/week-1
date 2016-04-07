class User
  attr_accessor :name, :position, :object

  def initialize(name, position)
  	@name = name
    @position = position
    @object = ""
  end

  def add_object(object)
  	@object = object
  end
end