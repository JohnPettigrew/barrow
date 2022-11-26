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
    draw_status_area
    draw_map_area
    @game_in_progress = false if @args.inputs.keyboard.key_down.escape
  end

  def draw_status_area
    # Status area is 360 wide by 720 high
    @args.outputs.solids << { x: 0, y: 0, w: 360, h: 720, r: 200, g: 200 }
    @args.outputs.labels  << {x: 180, y: 700, text: "Current score: #{@treasures}", size_enum: 5, alignment_enum: 1}
    @args.outputs.labels  << {x: 180, y: 400, text: "Inventory", size_enum: 5, alignment_enum: 1}
    @args.outputs.labels  << {x: 180, y: 350, text: "Lights: #{@inventory_lights}", size_enum: 3, alignment_enum: 1}
    @args.outputs.labels  << {x: 180, y: 310, text: "Pickaxes: #{@inventory_axes}", size_enum: 3, alignment_enum: 1}
    @args.outputs.labels  << {x: 180, y: 50, text: 'Hit escape to quit', size_enum: 5, alignment_enum: 1}
  end

  def draw_map_area
    # Map area is 920 wide by 720 high, with left at position 360
    @args.outputs.labels  << {x: 360 + 920/2, y: 500, text: 'Map area', size_enum: 5, alignment_enum: 1}
  end
