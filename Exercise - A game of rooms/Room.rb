class Room
  attr_accessor :position, :text, :fin, :object

  def initialize(position, text, fin, object)
  	@position = position
    @text = text
    @fin = fin
    @object = object
  end

  def check_position?(position)
  	@position[0] == position[0] && @position[1] == position[1]
  end

  def delete_object
  	@object = ""
  end
end