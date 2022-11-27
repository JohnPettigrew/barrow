class Player
  attr_sprite
  attr_accessor :position_x, :position_y

  def initialize(x:, y:, w:, h:, path:)
    @padding = 6
    @x = x + @padding
    @y = y + @padding
    @w = w
    @h = h
    @path = path
    @position_x = @position_y = 0
  end
end
