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
    
  def initialize(map_area_width:, player:)
    @map_area_width = map_area_width
    @player = player
    @start_tile = Tile.new(definition: START_TILE_DEFINITION, origin_x: 5000, origin_y: 5000)
    a=@start_tile
  end

  def current_area
    screen_area = []
    10.times do |r|
      row = r + @player.current_row
      screen_area[r] = []
      10.times do |c|
        column = c + @player.current_column
        screen_area[r][c] = @start_tile.definition["row_#{row}".to_sym]["column_#{column}".to_sym]
      end
    end
    screen_area
  end
end

class Tile
  attr_reader :definition

  def initialize(definition:, origin_x:, origin_y:)
    # The tile is a hash of hashes, and each defines a Location object:
    # {
    #   row_5000: {column_5000: <Location...>, column_5001: <Location...>, ...}, 
    #   row_5001: {column_5000: <Location...>, column_5001: <Location...>, ...},
    #   row_5002: {column_5000: <Location...>, column_5001: <Location...>, ...}
    # }
    @tile_size = 11
    @definition = {}
    @tile_size.times do |r|
      row = r + origin_y
      @definition["row_#{row}".to_sym] = {}
      @tile_size.times do |c|
        column = c + origin_x
        @definition["row_#{row}".to_sym]["column_#{column}".to_sym] = Location.new(location_value: definition[r][c])
      end
    end
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
