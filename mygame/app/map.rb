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
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,1],
      [0,0,0,0,0,0,0,0,0,0,0,1,1],
      [0,0,0,0,0,0,0,0,0,0,1,1,1],
      [0,0,0,0,0,0,0,0,0,1,1,1,1]
    ].freeze,
    start_right:[
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0],
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
    centre_offset = (@map_scale / 2).to_i
    screen_area = []
    @map_scale.times do |r|
      screen_area[r] = []
      row = r + @player.current_row - centre_offset
      @map_scale.times { |c| screen_area[r][c] = @map_hash["row_#{row}".to_sym]["column_#{c + @player.current_column - centre_offset}".to_sym] }
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
      selector = (origin_x.zero? || origin_y.zero?) ? :solid : TILE_ENTRY_POINTS[direction].sample
      create_tile(definition_selector: selector, origin_x: origin_x, origin_y: origin_y)
    end
  end

  def missing_adjacent_tiles(x:, y:)
    centre_offset = (@map_scale / 2).to_i
    value = {}
    # Have to check both whether the requested row is nil and whether it's present but doesn't contain the requested column
    row = "row_#{y + centre_offset}".to_sym
    value[:up] = round_up_to_tile_edge(number: y) if @map_hash[row].nil? || @map_hash[row]["column_#{x}".to_sym].nil?
    row = "row_#{y - centre_offset}".to_sym
    value[:down] = (round_down_to_tile_edge(number: y) - @tile_size) if @map_hash[row].nil? || @map_hash[row]["column_#{x}".to_sym].nil?
    # Requested row cannot be nil for the next options (if we're moving left/right, and we don't care about diagonals) because player stays on same row
    row = "row_#{y}".to_sym
    value[:left] = (round_down_to_tile_edge(number: x) - @tile_size) if @map_hash[row]["column_#{x - centre_offset}".to_sym].nil?
    value[:right] = round_up_to_tile_edge(number: x) if @map_hash[row]["column_#{x + centre_offset}".to_sym].nil?
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

  def location_accessible?(x:, y:)
    !@map_hash["row_#{y}".to_sym]["column_#{x}".to_sym].background?
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
end
