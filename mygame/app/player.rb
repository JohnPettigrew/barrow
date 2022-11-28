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
    # Start row is 5 because the start tile is (currently) 14 rows high and this will put the centre of the viewport at the right place.
    @current_row = 9
    # Start column is 7000 so that we have lots of space to wander the barrow, while being an easy multiple of the map tile size of 7.
    @current_column = 7007
  end

  def move_up
    # Decrement player position and return the required wait time before new input will be processed (to stop extremely rapid movement)
    [@current_row -= 1, 0].max
    10
  end

  def move_down
    # Increment player position and return the required wait time before new input will be processed (to stop extremely rapid movement)
    @current_row += 1
    10
  end

  def move_left
    # Decrement player position and return the required wait time before new input will be processed (to stop extremely rapid movement)
    [@current_column -= 1, 0].max
    10
  end

  def move_right
    # Increment player position and return the required wait time before new input will be processed (to stop extremely rapid movement)
    @current_column += 1
    10
  end
end
