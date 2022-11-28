class Map
  START_TILE_DEFINITION = [
                            [0,0,0,0,0,0,0,1,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,1,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,1,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,1,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,1,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,1,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,1,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,1,0,0,0,0,0,0],
                            [1,1,1,1,1,1,1,1,1,1,1,1,1,1],
                            [1,1,1,1,2,1,1,1,1,1,2,1,1,1],
                            [1,1,1,1,1,1,1,1,1,1,1,1,1,1],
                            [1,1,1,1,1,1,1,1,1,1,1,1,1,1],
                            [1,1,1,1,1,1,1,1,1,1,1,1,1,1],
                            [1,1,1,1,1,1,1,1,1,1,1,1,1,1]
                          ].freeze
    
  def initialize(map_area_width:, player:)
    @map_area_width = map_area_width
    @player = player
    @tile_size = 7
    @map_hash = create_tile(
        definition: START_TILE_DEFINITION, 
        origin_x: 7000, 
        origin_y: 0
      )
  end

  def current_area
    screen_area = []
    # Screen area is 10x10 locations, so the display origin needs to start 5 rows and 5 column earlier
    origin_x = @player.current_column - 5
    origin_y = @player.current_row - 5
    h = @map_hash
    10.times do |r|
      row = r + origin_y
      screen_area[r] = []
      10.times do |c|
        column = c + origin_x
        screen_area[r][c] = @map_hash["row_#{row}".to_sym]["column_#{column}".to_sym]
      end
    end   
    screen_area
  end

  def create_tile(definition:, origin_x:, origin_y:)
    # The tile is a hash of hashes, and each defines a Location object:
    # {
    #   row_5000: {column_5000: <Location...>, column_5001: <Location...>, ...}, 
    #   row_5001: {column_5000: <Location...>, column_5001: <Location...>, ...},
    #   row_5002: {column_5000: <Location...>, column_5001: <Location...>, ...}
    # }
    tile = {}
    definition.size.times do |r|
      row = r + origin_y
      tile["row_#{row}".to_sym] = {}
      definition.first.size.times do |c|
        column = c + origin_x
        tile["row_#{row}".to_sym]["column_#{column}".to_sym] = Location.new(location_value: definition[r][c])
      end
    end
    tile
  end
end

class Location
  attr_sprite
  attr_accessor :x

  def initialize(location_value:, discoverable: false, light: false, rockfall: false)
    @background = location_value.zero?
    @light = light || (@type == 2) ? true : false
    @discoverable = discoverable
    @rockfall = rockfall
    @x = @y = @size = 0
  end

  def size(size:)
    @size = size
    self
  end

  def set_position(horizontal_offset:, vertical_offset:)
    @x = horizontal_offset
    @y = vertical_offset
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
