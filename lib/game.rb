require_relative 'desk.rb'
require_relative 'player.rb'
require_relative 'dealer.rb'

class Game
  attr_reader :player, :dealer, :players, :status, :desk

  def initialize
    @dealer = Dealer.new
    @players = []
    @players << dealer
    @status = 1
  end

  def create_player(name)
    @player = Player.new(name)
    @players << player
  end

  def play
    @desk = Desk.new
    players_bet
    players_deal_card
  end

  def players_bet
    players.each(&:clear)
    players.each(&:bet)
  end

  def players_deal_card
    players.each do |player|
      2.times { player.take_card(desk) }
    end
  end

  def dealer_act
    dealer_take_card if dealer.can_take? && dealer.points < dealer.class::DEALER_STOP
    # open_cards if dealer.points > player.class::BLACK_JACK
  end

  def player_take_card
    player.take_card(desk) if player.can_take?
    dealer_act
  end

  def dealer_take_card
    dealer.take_card(desk) if dealer.can_take?
  end

  def result
    case winner
    when player, dealer
      winner_user(winner)
    else
      draw
    end
  end

  def winner_user(player)
    player.win_bank
  end

  def draw
    players.each(&:draw)
    'draw'
  end

  def winner
    return player if player.calc_points > dealer.calc_points && player.calc_points <= player.class::BLACK_JACK
    return dealer if dealer.calc_points > player.calc_points && dealer.calc_points <= dealer.class::BLACK_JACK
    return dealer if player.calc_points > player.class::BLACK_JACK
    return player if dealer.calc_points > dealer.class::BLACK_JACK
  end
end
