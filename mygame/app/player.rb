class Player
  attr_sprite
  attr_accessor :current_row, :current_column

  def initialize(x:, y:, path:, angle:, location_size:, tile_size:, map_scale:)
    # Set up the relationships to the map: pixel size of player, padding to location edges
    location_size = location_size.to_i
    padding = (location_size / 12).to_i
    # Stops player moving below or to the left of the mappable area (i.e. where row or column numbers would be negative)
    @movement_limit = (map_scale / 2).to_i
    # x, y, w, h, path and angle are screen coordinates, sizes and sprites used to plot the player on the screen. Not used otherwise.
    @x = (x + padding).to_i
    @y = (y + padding).to_i
    @w = @h = location_size - padding * 2
    @path = path
    @angle = angle
    # Start positions to put the centre of the viewport at the right place.
    @current_row = @movement_limit
    @current_column = tile_size * 100 + @current_row - 2
  end

  def serialize
    { player: { x: @x, y: @y, w: @w, h: @h, path: @path, angle: @angle, current_row: @current_row, current_column: @current_column }}
  end

  def move_up_or_down(move_up:)
    @current_row = move_up ? @current_row + 1 : [@current_row - 1, @movement_limit].max
  end

  def move_left_or_right(move_right:)
    @current_column = move_right ? @current_column + 1 : [@current_column - 1, @movement_limit].max
  end
end
