class Map
  MAP_DEFINITIONS = {
    start:[
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,1,1,1,0,0,0,0,0],
      [0,0,0,0,1,1,1,1,1,0,0,0,0],
      [0,0,0,1,1,1,1,1,1,1,0,0,0],
      [0,0,1,2,1,1,1,1,2,1,1,0,0],
      [0,1,1,1,1,1,1,1,1,1,1,1,0],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1]
    ].freeze,
    start_left:[
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,1],
      [0,0,0,0,0,0,0,0,0,0,0,1,1],
      [0,0,0,0,0,0,0,0,0,0,1,1,1],
      [0,0,0,0,0,0,0,0,0,1,1,1,1],
      [0,0,0,0,0,0,0,0,1,1,1,1,1],
      [0,0,0,0,0,0,0,1,1,1,1,1,1]
    ].freeze,
    start_right:[
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [1,0,0,0,0,0,0,0,0,0,0,0,0],
      [1,1,0,0,0,0,0,0,0,0,0,0,0],
      [1,1,1,0,0,0,0,0,0,0,0,0,0],
      [1,1,1,1,0,0,0,0,0,0,0,0,0],
      [1,1,1,1,1,0,0,0,0,0,0,0,0],
      [1,1,1,1,1,1,0,0,0,0,0,0,0]
    ].freeze,
    solid:[
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0]
    ].freeze,
    tile_000:[
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1]
    ].freeze,
    tile_001:[
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0]
    ].freeze,
    tile_002:[
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [1,1,1,1,1,1,1,1,1,1,1,1,1],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0]
    ].freeze,
    tile_003:[
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0],
      [0,0,0,0,0,0,1,0,0,0,0,0,0]
    ].freeze,
  }.freeze

  TILE_ENTRY_POINTS = {
    up: [:tile_000, :tile_001, :tile_003].freeze,
    down: [:tile_000, :tile_001, :tile_003].freeze,
    left: [:tile_000, :tile_001, :tile_002].freeze,
    right: [:tile_000, :tile_001, :tile_002].freeze,
    up_down: [:tile_000, :tile_001, :tile_003].freeze,
    left_right: [:tile_000, :tile_001, :tile_002].freeze,
    up_left: [:tile_000, :tile_001].freeze,
    up_right: [:tile_000, :tile_001].freeze,
    down_left: [:tile_000, :tile_001].freeze,
    down_right: [:tile_000, :tile_001].freeze,
    up_down_left_right: [:tile_000, :tile_001].freeze
  }.freeze

  def initialize(player:, tile_size:, map_area_width:, map_scale:)
    # player is the player object
    # tile_size is how many locations are in a (square) tile
    # map_area_width is the number of pixels in the (square) visible map area
    # map_scale is how many locations are in the current_area displayed on screen
    @player = player
    @tile_size = tile_size.to_i
    @map_area_width = map_area_width.to_i
    @map_scale = map_scale.to_i
    @map_hash = {}
    create_tile(definition_selector: :start, origin_x: tile_size * 100, origin_y: 0)
    create_tile(definition_selector: :start_left, origin_x: tile_size * 99, origin_y: 0)
    create_tile(definition_selector: :start_right, origin_x: tile_size * 101, origin_y: 0)
  end

  def current_area
    create_required_new_adjacent_tiles
    # Player is in the centre of the map, so halve the dimension to get the centre position. This is integer division, so will round down if we have an odd @map_scale
    centre_offset = (@map_scale / 2).to_i + 1
    screen_area = []
    # Current area needs to have one row and column extra on all sides so allow smooth scrolling
    (@map_scale + 2).times do |r|
      screen_area[r] = []
      row = r + @player.current_row - centre_offset
      (@map_scale + 2).times { |c| screen_area[r][c] = map_location(x: c + @player.current_column - centre_offset, y: row) }
    end
    screen_area
  end

  def location_accessible?(x:, y:)
    map_location(x: @player.current_column + x, y: @player.current_row + y).path?
  end

  def map_location(x:, y:)
    @map_hash["row_#{y}".to_sym]["column_#{x}".to_sym]
  end

  private

  def cell_missing?(x:, y:)
    @map_hash["row_#{y}".to_sym].nil? || map_location(x: x, y: y).nil?
  end

  def cell_exists?(x:, y:)
    !cell_missing?(x: x, y: y)
  end

  def create_required_new_adjacent_tiles
    missing_adjacent_tiles(x: @player.current_column, y: @player.current_row).each do |direction, origin|
      origin_x, origin_y = case direction
                           when :up, :down
                             [round_down_to_tile_edge(number: @player.current_column), origin]
                           when :left, :right
                             [origin, round_down_to_tile_edge(number: @player.current_row)]
                           end
      selector = origin_x.zero? || origin_y.zero? ? :solid : TILE_ENTRY_POINTS[direction].sample
      create_tile(definition_selector: selector, origin_x: origin_x, origin_y: origin_y)
    end
  end

  def missing_adjacent_tiles(x:, y:)
    offset = (@map_scale / 2).to_i
    result = {}
    { 
      up: { x: x, y: y + offset, origin: round_up_to_tile_edge(number: y)}, 
      down: {x: x, y: y - offset, origin: round_down_to_tile_edge(number: y) - @tile_size},
      left: {x: x - offset, y: y, origin: round_down_to_tile_edge(number: x) - @tile_size},
      right: {x: x + offset, y: y, origin: round_up_to_tile_edge(number: x)}
    }.each do |key, value|
      result[key] = value[:origin] if cell_missing?(x: value[:x], y: value[:y])
    end
    result
  end

  def round_down_to_tile_edge(number:)
    ((number / @tile_size).floor * @tile_size).to_i # We need to return an integer
  end

  def round_up_to_tile_edge(number:)
    ((number.to_f / @tile_size).ceil * @tile_size).to_i # We need to return an integer
  end

  def create_tile(definition_selector:, origin_x:, origin_y:)
    return unless @map_hash["row_#{origin_y}".to_sym].nil? || map_location(x: origin_x, y: origin_y).nil?

    # The tile is a hash of hashes, and each defines a Location object:
    # {
    #   row_0: {column_7000: <Location...>, column_7001: <Location...>, ...}, 
    #   row_1: {column_7000: <Location...>, column_7001: <Location...>, ...},
    #   row_2: {column_7000: <Location...>, column_7001: <Location...>, ...}
    # }
    MAP_DEFINITIONS[definition_selector].size.times do |r|
      row = r + origin_y
      @map_hash["row_#{row}".to_sym] ||= {}
      MAP_DEFINITIONS[definition_selector].first.size.times { |c| @map_hash["row_#{row}".to_sym]["column_#{c + origin_x}".to_sym] = Location.new(location_value: MAP_DEFINITIONS[definition_selector].reverse[r][c]) }
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
      @visible = false
    end

    def size(size:)
      @size = size
      self
    end

    def set_position(horizontal_offset:, vertical_offset:)
      @x = horizontal_offset
      @y = vertical_offset
      self
    end

    def background?
      @background
    end

    def path?
      !@background
    end

    def visible=(visible:)
      @visible = visible
    end

    def visible?
      @visible
    end

    def invisible?
      !@visible
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
end
