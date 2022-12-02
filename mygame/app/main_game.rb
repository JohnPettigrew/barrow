class MainGame
  attr_gtk

  SPRITE_PATHS = {
    player: 'mygame/sprites/circle/gray.png'
  }.freeze
  
  def initialize
    @show_welcome_screen = true
    @game_in_progress = false
    @default_wait = 5
    @wait_counter = -1
    @screen_height = 720
    @screen_width = 1280
    @map_scale = 16
    @tile_size = 13
    @map_location_size = (@screen_height / @map_scale).to_i
    @status_area_width = @screen_width - @screen_height
    @last_easing_direction = { up: false, down: false, left: false, right: false}
  end

  def tick
    @show_welcome_screen ? welcome_screen : game
  end

  private

    def welcome_screen
      draw_welcome_screen
      update_welcome_menu(move_up: inputs.up) if @wait_counter.negative? && !inputs.up_down.zero?
      welcome_menu_action if inputs.keyboard.key_down.enter
      @wait_counter -= 1 unless @wait_counter.negative?
    end

    def draw_welcome_screen
      outputs.labels  << { x: @screen_width / 2, y: 500, text: 'Welcome to the barrow!', size_enum: 10, alignment_enum: 1 }
      @welcome_menu ||= Menu.new(entries: [ {value: 'New game', selected: true}, {value: 'Resume game'}, {value: 'High scores'}, {value: 'Rules'}, {value: 'Quit'} ])
      @welcome_menu.render(args: @args, top: 420)
    end

    def update_welcome_menu(move_up:)
      @welcome_menu.move_up_or_down(move_up: move_up)
      @wait_counter = @default_wait
    end

    def welcome_menu_action
      case @welcome_menu.selected_entry
      when 'New game'
        @show_welcome_screen = @game_in_progress = false
      when 'Resume game'
        @show_welcome_screen = false
      when 'High scores'
      when 'Rules'
      else
        gtk.request_quit
      end
    end

    def game
      initialise_new_game unless @game_in_progress
      draw_map_area
      draw_status_area
      handle_game_inputs
    end

    def initialise_new_game
      # Calculations to ensure consistent dimensions throughout the objects.
      # These assume that the displayed area of map is square, using the height as the fixed dimension
      half_map_size = @screen_height / 2
      @player = Player.new(
        x: @status_area_width + half_map_size, 
        y: half_map_size, 
        path: SPRITE_PATHS[:player], 
        angle: 90, 
        location_size: @map_location_size, 
        tile_size: @tile_size, 
        map_scale: @map_scale
      )
      @map = Map.new(
        player: @player, 
        tile_size: @tile_size, 
        map_area_width: half_map_size * 2, 
        map_scale: @map_scale
      )
      @treasures = @inventory_lights = @inventory_axes = 0
      @game_in_progress = true
    end

    def handle_game_inputs
      if @wait_counter.negative?
        @player.move_up_or_down(move_up: inputs.up) if !inputs.up_down.zero? && @map.location_accessible?(x: 0, y: inputs.up ? 1 : -1)
        @player.move_left_or_right(move_right: inputs.right) if !inputs.left_right.zero? && @map.location_accessible?(x: inputs.right ? 1 : -1, y: 0)
        @wait_counter = @default_wait unless inputs.up_down.zero? && inputs.left_right.zero?
      end
      @show_welcome_screen = true if inputs.keyboard.key_down.escape
      @wait_counter -= 1 unless @wait_counter.negative?
    end

    def draw_status_area
      horizontal_centre = @status_area_width / 2
      outputs.solids << { x: 0, y: 0, w: @status_area_width, h: @screen_height, r: 200, g: 200 }
      outputs.labels  << {x: horizontal_centre, y: @screen_height - 20, text: "Current score: #{@treasures}", size_enum: 5, alignment_enum: 1}
      outputs.labels  << {x: horizontal_centre, y: @screen_height/2 + 50, text: "Inventory", size_enum: 5, alignment_enum: 1}
      outputs.labels  << {x: horizontal_centre, y: @screen_height/2, text: "Lights: #{@inventory_lights}", size_enum: 3, alignment_enum: 1}
      outputs.labels  << {x: horizontal_centre, y: @screen_height/2 - 40, text: "Pickaxes: #{@inventory_axes}", size_enum: 3, alignment_enum: 1}
      outputs.labels  << {x: horizontal_centre, y: 50, text: "Hit 'Escape' to end your game", size_enum: 5, alignment_enum: 1}
    end

    def draw_map_area
      outputs.sprites << @player
      easing_x, easing_y = get_easing_values
      # When scrolling the map, need to subtract 1 from row and column numbers because there's one extra row & column on each side of the returned current_area to allow smooth scrolling
      @map.current_area.each_with_index do |row, r|
        row.each_with_index do |cell, c|
          horizontal_offset = @status_area_width + @map_location_size * (c - 1) + easing_x
          vertical_offset = @map_location_size * (r - 1) + easing_y
          outputs.solids << cell.size(size: @map_location_size).set_position(horizontal_offset: horizontal_offset, vertical_offset: vertical_offset) unless cell.nil? 
        end
      end
    end

    def get_easing_values
      start_time = state.tick_count - (@wait_counter.negative? ? 0 : @wait_counter)
      easing = @args.easing.ease(start_time, state.tick_count, @default_wait, :identity) * @map_location_size
      # Only add easing if we're not trying to move into an inaccessible location (otherwise we get a nasty 'bouncing' effect)
      easing = 1 if inputs.up && @last_easing_direction[:up] && !@map.location_accessible?(x: 0, y: 1)
      easing = -1 if inputs.down && @last_easing_direction[:down] && !@map.location_accessible?(x: 0, y: -1)
      easing = -1 if inputs.left && @last_easing_direction[:left] && !@map.location_accessible?(x: -1, y: 0)
      easing = 1 if inputs.right && @last_easing_direction[:right] && !@map.location_accessible?(x: 1, y: 0)
      @last_easing_direction = { up: inputs.up, down: inputs.down, left: inputs.left, right: inputs.right}
      case
      when inputs.up
        [1, easing]
      when inputs.down
        [1, -easing]
      when inputs.left
        [-easing, 1]
      when inputs.right
        [easing, 1]
      else
        [1, 1]
      end
    end
end
