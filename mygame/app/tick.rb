def tick args
  $main_game ||= MainGame.new
  $main_game.args = args
  $main_game.tick
end
