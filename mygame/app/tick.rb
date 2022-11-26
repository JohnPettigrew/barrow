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
    @args.outputs.labels  << [640, 500, 'Map area', 5, 1]
    @args.outputs.labels  << [640, 460, 'Status area', 5, 1]
    @args.outputs.labels  << [640, 420, 'Quit', 5, 1]
  end
