require_relative 'interface.rb'
require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'dealer.rb'

class Blackjack
  def initialize
    player = Player.new('Alex')
    dealer = Dealer.new
    game = Game.new(player, dealer)
    Interface.new(game)
  end
end
