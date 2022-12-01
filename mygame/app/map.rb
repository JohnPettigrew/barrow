class Map
  MAP_DEFINITIONS = {
    start:[
            [0,0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,1,0,0,0,0,0],
            [1,1,1,1,1,1,1,1,1,1,1],
            [1,1,2,1,1,1,1,1,2,1,1],
            [1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1]
          ].freeze,
    default:[
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
              [1,0,1,0,1,0,1,0,1,0,1],
            ].freeze
    }.freeze

  def initialize(map_area_width:, player:)
    @map_area_width = map_area_width
    @player = player
    @map_hash = {}
    @tile_size = 11
    create_tile(definition_selector: :start, origin_x: 1100, origin_y: 0)
  end

  def current_area
    create_required_new_adjacent_tiles
    screen_area = []
    # Screen area is 10x10 locations
    10.times do |r|
      screen_area[r] = []
      row = r + @player.current_row - 5 # Start map 5 locations below the player (10x10 grid)
      10.times { |c| screen_area[r][c] = @map_hash["row_#{row}".to_sym]["column_#{c + @player.current_column - 5}".to_sym] }
    end
    screen_area
  end

  def create_required_new_adjacent_tiles
    missing_adjacent_tiles(x: @player.current_column, y: @player.current_row).each do |direction, origin|
      case direction
      when :up, :down
        origin_x = round_down_to_tile_edge(number: @player.current_column)
        origin_y = origin
      when :left, :right
        origin_x = origin
        origin_y = round_down_to_tile_edge(number: @player.current_row)
      end
      create_tile(definition_selector: :default, origin_x: origin_x, origin_y: origin_y)
    end
  end

  def missing_adjacent_tiles(x:, y:)
    value = {}
    # Have to check both whether the requested row is nil and whether it's present but doesn't contain the requested column
    row = "row_#{y + 5}".to_sym
    value[:up] = round_up_to_tile_edge(number: y) if @map_hash[row].nil? || @map_hash[row]["column_#{x}".to_sym].nil?
    row = "row_#{y - 5}".to_sym
    value[:down] = (round_down_to_tile_edge(number: y) - @tile_size) if @map_hash[row].nil? || @map_hash[row]["column_#{x}".to_sym].nil?
    # Requested row cannot be nil for the next options (if we're moving left/right, and we don't care about diagonals) because player stays on same row
    row = "row_#{y}".to_sym
    value[:left] = (round_down_to_tile_edge(number: x) - @tile_size) if @map_hash[row]["column_#{x - 5}".to_sym].nil?
    value[:right] = round_up_to_tile_edge(number: x) if @map_hash[row]["column_#{x + 5}".to_sym].nil?
    value
  end

  def round_down_to_tile_edge(number:)
    ((number / @tile_size).floor * @tile_size).to_i # Must return an integer
  end

  def round_up_to_tile_edge(number:)
    ((number.to_f / @tile_size).ceil * @tile_size).to_i # Must return an integer
  end

  def create_tile(definition_selector:, origin_x:, origin_y:)
    return unless @map_hash["row_#{origin_y}".to_sym].nil? || @map_hash["row_#{origin_y}".to_sym]["column_#{origin_x}".to_sym].nil?

    # The tile is a hash of hashes, and each defines a Location object:
    # {
    #   row_0: {column_7000: <Location...>, column_7001: <Location...>, ...}, 
    #   row_1: {column_7000: <Location...>, column_7001: <Location...>, ...},
    #   row_2: {column_7000: <Location...>, column_7001: <Location...>, ...}
    # }
    MAP_DEFINITIONS[definition_selector].size.times do |r|
      row = r + origin_y
      @map_hash["row_#{row}".to_sym] ||= {}
      MAP_DEFINITIONS[definition_selector].first.size.times do |c|
        column = c + origin_x
        # In the next line, we reverse the definition array because its (visually) bottom row will be the first (bottom and thus first) row of the actual map, but it is last in the definition array
        @map_hash["row_#{row}".to_sym]["column_#{column}".to_sym] = Location.new(location_value: MAP_DEFINITIONS[definition_selector].reverse[r][c])
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
