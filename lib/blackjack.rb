require_relative 'interface.rb'
require_relative 'user.rb'
require_relative 'game.rb'

class Blackjack
  attr_reader :player, :dealer

  def initialize
    initialize_game
    start_game
  end

  private

  def initialize_game
    @interface = Interface.new
    @player = User.new(gets.chomp.to_s)
    @dealer = User.new('dealer')
  end

  def start_game
    game = Game.new(@interface, @player, @dealer)
    while game.status == 1
      game.print_state
      game.play
    end
  end
end
