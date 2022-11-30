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
    create_tile(definition: START_TILE_DEFINITION, origin_x: 7000, origin_y: 0)
  end

  def current_area
    create_required_new_adjacent_tiles
    screen_area = []
    # Screen area is 10x10 locations
    origin_x = [@player.current_column, 0].max
    origin_y = [@player.current_row, 0].max
    10.times do |r|
      screen_area[r] = []
      row = r + origin_y - 5 # Start map 5 locations below the player (10x10 grid)
      10.times { |c| screen_area[r][c] = @map_hash["row_#{row}".to_sym]["column_#{c + origin_x - 5}".to_sym]}
    end
    screen_area
  end

  def create_required_new_adjacent_tiles
    # Check the four directions, then if any new tiles are needed, create them using the returned origin coordinates
    missing_adjacent_tiles(x: @player.current_column, y: @player.current_row).each do |direction, origin|
      case direction
      when :up, :down
        origin_x = round_down_to_tile_edge(number: @player.current_column)
        origin_y = origin
      when :left, :right
        origin_x = origin
        origin_y = round_down_to_tile_edge(number: @player.current_row)
      end
      # create_tile(
      #   definition: START_TILE_DEFINITION, 
      #   origin_x: origin_x, 
      #   origin_y: origin_y
      # )
    end
  end

  def missing_adjacent_tiles(x:, y:)
    # Round player position to nearest 10 (tile boundaries) and return the origin point for any required new tiles
    value = {}
    edge_top = round_up_to_tile_edge(number: y)
    edge_condition = (edge_top - y < 6) && @map_hash["row_#{edge_top}".to_sym].nil?
    value[:up] = edge_top if edge_condition
    edge_bottom = [round_down_to_tile_edge(number: y) - 1, 0].max
    edge_condition = (y - edge_bottom < 6) && @map_hash["row_#{edge_bottom}".to_sym].nil?
    value[:down] = edge_bottom - @tile_size if edge_condition
    edge_left = [round_down_to_tile_edge(number: x) - 1, 0].max
    edge_condition = (x - edge_left < 6) && @map_hash["row_#{edge_left}".to_sym].nil?
    value[:left] = edge_left if edge_condition
    edge_right = round_up_to_tile_edge(number: x)
    edge_condition = (edge_right - x < 6) && @map_hash["row_#{edge_right}".to_sym].nil?
    value[:right] = edge_right - @tile_size if edge_condition
    value
  end

  def round_down_to_tile_edge(number:)
    (number / @tile_size).floor * @tile_size
  end

  def round_up_to_tile_edge(number:)
    (number / @tile_size).ceil * @tile_size
  end

  def create_tile(definition:, origin_x:, origin_y:)
    # The tile is a hash of hashes, and each defines a Location object:
    # {
    #   row_0: {column_7000: <Location...>, column_7001: <Location...>, ...}, 
    #   row_1: {column_7000: <Location...>, column_7001: <Location...>, ...},
    #   row_2: {column_7000: <Location...>, column_7001: <Location...>, ...}
    # }
    @map_hash = {}
    definition.size.times do |r|
      row = r + origin_y
      @map_hash["row_#{row}".to_sym] = {}
      definition.first.size.times do |c|
        column = c + origin_x
        # In the next line, we reverse the definition array because its (visually) bottom row will be the first (bottom and thus first) row of the actual map, but it is last in the definition array
        @map_hash["row_#{row}".to_sym]["column_#{column}".to_sym] = Location.new(location_value: definition.reverse[r][c])
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
