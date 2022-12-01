class MainGame
  attr_gtk

  SPRITE_PATHS = {
    player: 'mygame/sprites/circle/gray.png',
    logo: 'dragonruby.png'
  }.freeze
  
  def initialize
    @show_welcome_screen = true
    @game_in_progress = false
    @default_wait = 10
    @wait_counter = -1
    @screen_height = 720
    @screen_width = 1280
    @map_location_size = 72
    @status_area_width = @screen_width - @screen_height
  end

  def tick
    @show_welcome_screen ? welcome_screen : new_game
  end

  private

    def welcome_screen
      draw_welcome_screen
      update_welcome_menu(move_up: inputs.up) if @wait_counter.negative? && !inputs.up_down.zero?
      welcome_menu_action if inputs.keyboard.key_down.enter
      @wait_counter -= 1 unless @wait_counter.negative?
    end

    def draw_welcome_screen
      @welcome_menu ||= Menu.new(entries: [ {value: 'Start game', selected: true}, {value: 'High scores'}, {value: 'Rules'}, {value: 'Quit'} ])
      @welcome_menu.render(args: @args, top: 420)
      outputs.labels  << { x: @screen_width / 2, y: 500, text: 'Welcome to the barrow!', size_enum: 10, alignment_enum: 1 }
      logo_width = 128
      outputs.sprites << { x: @screen_width / 2 - logo_width / 2, y: 140, w: logo_width, h: 101, path: SPRITE_PATHS[:logo] }  
    end

    def update_welcome_menu(move_up:)
      @welcome_menu.move_up_or_down(move_up: move_up)
      @wait_counter = @default_wait
    end

    def welcome_menu_action
      case @welcome_menu.selected_entry
      when 'Start game'
        @show_welcome_screen = false
      when 'High scores'
      when 'Rules'
      else
        gtk.request_quit
      end
    end

    def new_game
      initialise_new_game unless @game_in_progress
      draw_status_area
      draw_map_area
      handle_game_inputs
    end

    def initialise_new_game
      half_map_size = @screen_height / 2
      @player = Player.new(x: @status_area_width + half_map_size, y: half_map_size, location_size: @map_location_size, path: SPRITE_PATHS[:player], angle: 90)
      @map = Map.new(map_area_width: half_map_size * 2, player: @player)
      @treasures = @inventory_lights = @inventory_axes = 0
      @game_in_progress = true
    end

    def handle_game_inputs
      if @wait_counter.negative?
        @player.move_up_or_down(move_up: inputs.up) unless inputs.up_down.zero?
        @player.move_left_or_right(move_left: inputs.left) unless inputs.left_right.zero?
        @wait_counter = @default_wait unless inputs.up_down.zero? && inputs.left_right.zero?
      end
      if inputs.keyboard.key_down.escape
        @show_welcome_screen = true
        @game_in_progress = false
      end
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
      @map.current_area.each_with_index do |row, r|
        row.each_with_index do |cell, c|
          cell.size(size: 72).set_position(horizontal_offset: @status_area_width + @map_location_size * c, vertical_offset: @map_location_size * r) unless cell.nil? # Allow display of nonexistent cells, because these may arise from uncreated tiles in diagonal directions
          outputs.solids << cell
        end
      end
    end
end
