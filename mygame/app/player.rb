class Player
  attr_sprite
  attr_accessor :current_row, :current_column

  def initialize(x:, y:, path:, angle:, location_size:, tile_size:, map_scale:)
    # Set up the relationships to the map: pixel size of player, padding to location edges
    location_size = location_size.to_i
    padding = (location_size / 12).to_i
    # Stops player moving below the visible area
    @movement_limit = (map_scale / 2).to_i
    # x, y, w, h, path and angle are screen coordinates, sizes and sprites used to plot the player on the screen. Not used otherwise.
    @x = (x + padding).to_i
    @y = (y + padding).to_i
    @w = @h = location_size - padding * 2
    @path = path
    @angle = angle
    # Start row to put the centre of the viewport at the right place.
    @current_row = @movement_limit
    # Start position is 100 times the @tile_size so that we have lots of space to wander the barrow. And we add half the @tile_size (as the already-defined @current_row) so the player is in the middle of the screen.
    @current_column = tile_size * 100 + @current_row - 1
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
                     [@current_row - 1, @movement_limit].max
                   end
  end

  def move_left_or_right(move_left:)
    @current_column = if move_left
                        # Decrement player position to a minimum of 5 so we don't try and generate unneeded negative-value areas in the @map_hash
                        @current_column - 1
                      else
                        # Increment player position
                        @current_column + 1
                      end
  end
end
