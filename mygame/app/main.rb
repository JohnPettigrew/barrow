require 'app/map.rb'
require 'app/menu.rb'
require 'app/player.rb'
require 'app/main_game.rb'

def tick args
  $main_game ||= MainGame.new
  $main_game.args = args
  $main_game.tick
end
