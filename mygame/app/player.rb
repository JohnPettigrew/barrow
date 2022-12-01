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
    # Start row is 5 to put the centre of the viewport at the right place.
    @current_row = 5
    # Start column is 1100 + 5 so that we have lots of space to wander the barrow, while being 5 more than an easy multiple of the map tile size of 11.
    @current_column = 1105
  end

  def serialize
    { player: { x: @x, y: @y, w: @w, h: @h, path: @path, angle: @angle, current_row: @current_row, current_column: @current_column }}
  end

  def move_up_or_down(move_up:)
    @current_row = if move_up
                     # Increment player position
                     @current_row + 1
                   else
                     # Decrement player position to a minimum of 5 so we don't try and generate unneeded negative-value areas in the @map_hash
                     [@current_row - 1, 5].max
                   end
  end

  def move_left_or_right(move_left:)
    @current_column = if move_left
                        # Decrement player position to a minimum of 5 so we don't try and generate unneeded negative-value areas in the @map_hash
                        [@current_column - 1, 5].max
                      else
                        # Increment player position
                        @current_column + 1
                      end
  end
end
