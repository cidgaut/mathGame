# main game file that will require all other files.
require_relative 'player'
require_relative 'game'

game = Game.new
game.start