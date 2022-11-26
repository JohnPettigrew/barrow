class Map
  def initialize
    @tile_width = 11
    @tile_height = 11
    @tile = create_tile(define_start_tile)
  end

  def current_area(player_vertical_offset: 0, player_horizontal_offset: 0)
    screen_area = []
    (0 ... 10).to_a.each do |row|
      screen_area[row] = []
      (0 ... 10).to_a.each do |column|
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
        [0,0,0,0,0,1,0,0,0,0,0],
        [0,0,0,0,0,1,0,0,0,0,0],
        [0,0,0,0,0,1,0,0,0,0,0],
        [0,0,0,0,0,1,0,0,0,0,0],
        [0,0,0,0,0,1,0,0,0,0,0],
        [1,1,1,1,1,1,1,1,1,1,1],
        [1,2,1,1,1,1,1,1,1,2,1]
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
      (0 ... @tile_height).to_a.each do |row|
        tile["row_#{row}".to_sym] = {}
        (0 ... @tile_width).to_a.each do |column|
          tile["row_#{row}".to_sym]["column_#{column}".to_sym] = Location.new(location_value: definition[row][column])
        end
      end
      tile
    end
end

class Location
  attr_reader :type

  def initialize(location_value:)
    @type = case location_value
            when 0
              :background
            when 1
              :path
            when 2
              :light
            when 3
              :discoverable
            when 4
              :rockfall
            end
  end

  def background?
    @type == :background
  end

  def path?
    @type == :path
  end

  def light?
    @type == :light
  end

  def discoverable?
    @type == :discoverable
  end

  def rockfall?
    @type == :rockfall
  end
end
