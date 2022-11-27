class Player
  attr_sprite
  attr_accessor :current_row, :current_column

  def initialize(x:, y:, location_size:, path:, angle:)
    # NB @x and @y must be integers - they're used to label columns and rows in the map. 
    # So make sure to use #to_i whenever they're updated.
    @padding = 6
    @x = (x + @padding).to_i
    @y = (y + @padding).to_i
    @w = location_size - @padding * 2
    @h = location_size - @padding * 2
    @path = path
    @angle = angle
    @current_row = 5000
    @current_column = 5000
  end

  def move_up
    @current_row += 1
    10
  end

  def move_down
    @current_row -= 1 unless @current_row.zero?
    10
  end

  def move_left
    @current_column -= 1 unless @current_column.zero?
    10
  end

  def move_right
    @current_column += 1
    10
  end
end
