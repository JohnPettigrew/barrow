class Map
  START_TILE_DEFINITION = [
                            [0,0,0,0,0,1,0,0,0,0,0],
                            [0,0,0,0,0,1,0,0,0,0,0],
                            [0,0,0,0,0,1,0,0,0,0,0],
                            [0,0,0,0,0,1,0,0,0,0,0],
                            [1,1,1,1,1,1,1,1,1,1,1],
                            [1,1,1,1,1,1,1,1,1,1,1],
                            [1,2,1,1,1,1,1,1,1,2,1],
                            [1,1,1,1,1,1,1,1,1,1,1],
                            [1,1,1,1,1,1,1,1,1,1,1],
                            [1,1,1,1,1,1,1,1,1,1,1],
                            [1,1,1,1,1,1,1,1,1,1,1]
                          ].freeze
    
  def initialize(left:, map_location_size:, map_area_width:, player:)
    @left = left
    @map_location_size = map_location_size
    @map_area_width = map_area_width
    @player = player
    @tile_size = 11
    @start_tile = create_tile(START_TILE_DEFINITION)
  end

  def current_area
    screen_area = []
    10.times do |r|
      row = r + @player.current_row
      screen_area[r] = []
      10.times do |c|
        column = c + @player.current_column
        screen_area[r][c] = @start_tile["row_#{row}".to_sym]["column_#{column}".to_sym]
      end
    end
    screen_area
  end

  private

    def create_tile(definition)
      # The tile is a hash of hashes, and each defines a Location object:
      # {
      #   row_5000: {column_5000: <Location...>, column_5001: <Location...>, ...}, 
      #   row_5001: {column_5000: <Location...>, column_5001: <Location...>, ...},
      #   row_5002: {column_5000: <Location...>, column_5001: <Location...>, ...}
      # }
      tile = {}
      @tile_size.times do |r|
        row = r + @player.current_row
        tile["row_#{row}".to_sym] = {}
        @tile_size.times do |c|
          column = c + @player.current_column
          tile["row_#{row}".to_sym]["column_#{column}".to_sym] = Location.new(
            location_value: definition[r][c], 
            size: @map_location_size, 
            map_left: @left
          )
        end
      end
      tile
    end
end

class Location
  attr_sprite
  attr_reader :type

  def initialize(location_value:, map_left:, size:, discoverable: false, light: false, rockfall: false)
    @background = location_value.zero?
    @light = light || (@type == 2) ? true : false
    @discoverable = discoverable
    @rockfall = rockfall
    @map_left = map_left
    @size = size
    @x = @map_left
    @y = 0
  end

  def set_position(horizontal_offset:, vertical_offset:)
    @x = @map_left + @size * horizontal_offset
    @y = @size * (10 - vertical_offset)
  end

  def background?
    @background
  end

  def path?
    !@background
  end

  def light?
    @light
  end

  def discoverable?
    @discoverable
  end

  def rockfall?
    @rockfall
  end

  def w
    @size
  end

  def h
    @size
  end

  # Methods #r, #g and #b needed only because we're rendering the location as a solid for now   
  def r
    self.background? ? 50 : 250
  end

  def g
    self.background? ? 50 : 250
  end

  def b
    self.background? ? 50 : 250
  end
end
