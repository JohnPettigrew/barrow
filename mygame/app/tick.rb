SPRITE_PATHS = {
  player: 'mygame/sprites/circle/gray.png'
}.freeze

def tick args
  initial_setup
  @args = args
  @game_in_progress ? play_game : welcome_screen
  @title_text_size = 10
end

private

  def initial_setup
    @game_in_progress ||= false
    @wait_counter ||= 0
    @treasures ||= 0
    @inventory_lights ||= 0
    @inventory_axes ||= 0  
  end

  def welcome_screen
    draw_welcome_screen
    if @wait_counter.negative?
      update_welcome_menu(move_up: true) if @args.inputs.up
      update_welcome_menu(move_up: false) if @args.inputs.down
    end
    welcome_menu_action if @args.inputs.keyboard.key_down.enter
    @wait_counter -= 1 unless @wait_counter.negative?
  end

  def draw_welcome_screen
    @welcome_menu ||= Menu.new(entries: [ {value: 'Start game', selected: true}, {value: 'High scores'}, {value: 'Rules'}, {value: 'Quit'} ])
    @welcome_menu.render(args: @args, top: 420)
    @args.outputs.labels  << { x: 640, y: 500, text: 'Welcome to the barrow!', size_enum: @title_text_size, alignment_enum: 1 }
    @args.outputs.sprites << { x: 576, y: 140, w: 128, h: 101, path: 'dragonruby.png' }  
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
      @args.gtk.request_quit
    end
  end

  def play_game
    @map = Map.new
    draw_status_area
    draw_map_area
    @game_in_progress = false if @args.inputs.keyboard.key_down.escape
  end

  def draw_status_area
    # Status area is 560 wide by 720 high
    width = 560
    height = 720
    @args.outputs.solids << { x: 0, y: 0, w: width, h: height, r: 200, g: 200 }
    @args.outputs.labels  << {x: width/2, y: height - 20, text: "Current score: #{@treasures}", size_enum: 5, alignment_enum: 1}
    @args.outputs.labels  << {x: width/2, y: height/2 + 50, text: "Inventory", size_enum: 5, alignment_enum: 1}
    @args.outputs.labels  << {x: width/2, y: height/2, text: "Lights: #{@inventory_lights}", size_enum: 3, alignment_enum: 1}
    @args.outputs.labels  << {x: width/2, y: height/2 - 40, text: "Pickaxes: #{@inventory_axes}", size_enum: 3, alignment_enum: 1}
    @args.outputs.labels  << {x: width/2, y: 50, text: 'Hit escape to quit', size_enum: 5, alignment_enum: 1}
  end

  def draw_map_area
    # Map area is 720 wide by 720 high, with left at position 560
    # Location size is 72x72
    left = 560
    height = width = 720
    location_size = 60
    @args.outputs.sprites << { x: left + width/2 - location_size/2, y: height/2 - location_size/2, w: location_size, h: location_size, path: SPRITE_PATHS[:player] }  
    current_area = @map.current_area(player_vertical_offset: 0, player_horizontal_offset: 0)
    current_area.each_with_index do |row, vertical_offset|
      row.each_with_index do |cell, horizontal_offset|
        cell_shade = cell.background? ? 50 : 250
        @args.outputs.solids << { x: left + location_size * horizontal_offset, y: location_size * (10-vertical_offset), w: location_size, h: location_size, r: cell_shade, g: cell_shade, b: cell_shade }
      end
    end
  end
