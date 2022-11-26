def tick args
  @game_in_progress ||= false
  @args = args
  @game_in_progress ? play_game : welcome_screen
  @title_text_size = 10
end

private

  def welcome_screen
    draw_welcome_screen
    @welcome_menu.update_selection(move_up: true) if @args.inputs.up
    @welcome_menu.update_selection(move_up: false) if @args.inputs.down
  end

  def draw_welcome_screen
    @args.outputs.labels  << { x: 640, y: 500, text: 'Welcome to the Barrow', size_enum: @title_text_size, alignment_enum: 1 }
    @welcome_menu ||= Menu.new(entries: [ {value: 'Start game'},
                                          {value: 'High scores'},
                                          {value: 'Rules', selected: true},
                                          {value: 'Quit'} ])
    @welcome_menu.render(args: @args, top: 420)
    @args.outputs.sprites << { x: 576, y: 140, w: 128, h: 101, path: 'dragonruby.png' }  
  end

  def play_game
    @args.outputs.labels  << [640, 500, 'Map area', 5, 1]
    @args.outputs.labels  << [640, 460, 'Status area', 5, 1]
    @args.outputs.labels  << [640, 420, 'Quit', 5, 1]
  end
