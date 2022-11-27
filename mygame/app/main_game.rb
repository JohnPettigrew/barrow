class MainGame
  attr_gtk

  SPRITE_PATHS = {
    player: 'mygame/sprites/circle/gray.png',
    logo: 'dragonruby.png'
  }.freeze
  
  def initialize
    @game_in_progress = false
    @wait_counter = -1
    @treasures = @inventory_lights = @inventory_axes = 0
    @title_text_size = 10
    @screen_height = 720
    @screen_width = 1280
    @status_area_width = 560
    @map_width = @screen_width - @status_area_width
    @map_horizontal_centre = @status_area_width + @map_width / 2
    @map_vertical_centre = @screen_height / 2
    @map_location_size = 72
    @player = Player.new(x: @map_horizontal_centre, y: @map_vertical_centre, w: @map_location_size - 12, h: @map_location_size - 12, path: SPRITE_PATHS[:player])
  end

  def tick
    @game_in_progress ? play_game : welcome_screen
  end

  private

    def welcome_screen
      draw_welcome_screen
      if @wait_counter.negative?
        update_welcome_menu(move_up: true) if inputs.up
        update_welcome_menu(move_up: false) if inputs.down
      end
      welcome_menu_action if inputs.keyboard.key_down.enter
      @wait_counter -= 1 unless @wait_counter.negative?
    end

    def draw_welcome_screen
      @welcome_menu ||= Menu.new(entries: [ {value: 'Start game', selected: true}, {value: 'High scores'}, {value: 'Rules'}, {value: 'Quit'} ])
      @welcome_menu.render(args: @args, top: 420)
      outputs.labels  << { x: @screen_width / 2, y: 500, text: 'Welcome to the barrow!', size_enum: @title_text_size, alignment_enum: 1 }
      logo_width = 128
      outputs.sprites << { x: @screen_width / 2 - logo_width / 2, y: 140, w: logo_width, h: 101, path: SPRITE_PATHS[:logo] }  
    end

    def update_welcome_menu(move_up:)
      @welcome_menu.update_selection(move_up: move_up)
      @wait_counter = 10
    end

    def welcome_menu_action
      case @welcome_menu.selected_entry
      when 'Start game'
        @game_in_progress = true
      when 'High scores'
      when 'Rules'
      else
        gtk.request_quit
      end
    end

    def play_game
      @map = Map.new(left: @status_area_width, map_location_size: @map_location_size)
      draw_status_area
      draw_map_area
      @game_in_progress = false if inputs.keyboard.key_down.escape
    end

    def draw_status_area
      horizontal_centre = @status_area_width / 2
      height = 720
      outputs.solids << { x: 0, y: 0, w: @status_area_width, h: height, r: 200, g: 200 }
      outputs.labels  << {x: horizontal_centre, y: height - 20, text: "Current score: #{@treasures}", size_enum: 5, alignment_enum: 1}
      outputs.labels  << {x: horizontal_centre, y: height/2 + 50, text: "Inventory", size_enum: 5, alignment_enum: 1}
      outputs.labels  << {x: horizontal_centre, y: height/2, text: "Lights: #{@inventory_lights}", size_enum: 3, alignment_enum: 1}
      outputs.labels  << {x: horizontal_centre, y: height/2 - 40, text: "Pickaxes: #{@inventory_axes}", size_enum: 3, alignment_enum: 1}
      outputs.labels  << {x: horizontal_centre, y: 50, text: "Hit 'Escape' to return to the menu", size_enum: 5, alignment_enum: 1}
    end

    def draw_map_area
      outputs.sprites << @player
      current_area = @map.current_area(player: @player)
      current_area.each_with_index do |row, r|
        row.each_with_index do |cell, c|
          cell.set_position(horizontal_offset: c, vertical_offset: r)
          outputs.solids << cell
        end
      end
    end
end