class Map
  def initialize(left:, map_location_size:)
    @left = left
    @map_location_size = map_location_size
    @tile_width = 11
    @tile_height = 11
    @tile = create_tile(define_start_tile)
  end

  def current_area(player:)
    screen_area = []
    10.times do |row|
      screen_area[row] = []
      10.times do |column|
        screen_area[row][column] = @tile["row_#{row}".to_sym]["column_#{column}".to_sym]
      end
    end
    screen_area
end

  private

    def define_start_tile
      [
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
      ]
    end

    def create_tile(definition)
      # The tile is a hash of hashes:
      # {
      #   row_0: {column_0: 0, column_1: 1, column_2: 0}, 
      #   row_1: {column_0: 0, column_1: 1, column_2: 0},
      #   row_2: {column_0: 0, column_1: 1, column_2: 0}
      # }
      tile = {}
      @tile_height.times do |row|
        tile["row_#{row}".to_sym] = {}
        @tile_width.times do |column|
          tile["row_#{row}".to_sym]["column_#{column}".to_sym] = Location.new(location_value: definition[row][column], size: @map_location_size, map_left: @left)
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
