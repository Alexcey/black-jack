require_relative 'game.rb'
require_relative 'interface.rb'

class Blackjack
  def initialize
    game = Game.new
    Interface.new(game)
  end
end
