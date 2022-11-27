class Player
  attr_sprite
  attr_accessor :position_x, :position_y

  def initialize(x:, y:, location_size:, path:)
    @padding = 6
    @x = x + @padding
    @y = y + @padding
    @w = location_size - @padding * 2
    @h = location_size - @padding * 2
    @path = path
    @position_x = @position_y = 0
  end
end
