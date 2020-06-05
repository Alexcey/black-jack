require_relative 'interface.rb'
require_relative 'user.rb'

class Blackjack

  attr_reader :player, :dealer

  def initialize
    initialize_game
    #start_game
  end

  private

  def initialize_game
    @interface = Interface.new
    @player = User.new(gets.chomp.to_s)
    @dealer = User.new('dealer')
  end

  def start_game

  end
end
 