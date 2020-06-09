require_relative 'desk.rb'

class Game
  attr_reader :status, :interface, :player, :dealer, :players, :desk

  ROUND_MENU = {
    1 => :dealer_act,
    2 => :player_take_card,
    3 => :open_cards
  }.freeze

  def initialize(interface, player, dealer)
    @interface = interface
    @player = player
    @dealer = dealer
    @players = [player, dealer]
    @status = 1
  end

  def print_state
    interface.print_state(player, dealer)
  end

  def play
    @desk = Desk.new
    players_bet
    players_deal_card
    players_act
  end

  def players_bet
    players.each(&:bet)
    interface.print_bet(player.class::RATE)
  end

  def players_deal_card
    players.each do |player|
      show_card = player.name != 'dealer'
      2.times { player.take_card(desk) }
      interface.print_cards(player, show_card)
      interface.print_point(player) if show_card
    end
  end

  def players_act
    interface.round_choice
    choice = gets.chomp.to_i
    send ROUND_MENU[choice]
  end

  def dealer_act
    dealer_take_card if dealer.can_take? && player.points < player.class::DEALER_STOP
    open_cards if dealer.points > player.class::BLACK_JACK
  end

  def player_take_card
    player.take_card(desk) if player.can_take?
    interface.print_card_last(player, true)
    interface.print_point(player)
    dealer_act
  end

  def open_cards
    calc_result
    play_again?
  end

  def dealer_take_card
    dealer.take_card(desk) if dealer.can_take?
    interface.print_card_last(dealer, false)
    open_cards
  end

  def calc_result
    interface.print_cards(dealer, true)
    interface.print_point(dealer)
    case winner
    when player, dealer
      winner_user(winner)
    else
      draw
    end
  end

  def draw
    players.each(&:draw)
    interface.draw
  end

  def winner_user(player)
    player.win_bank
    interface.print_winner(player)
  end

  def winner
    return player if player.points > dealer.points && player.points <= player.class::BLACK_JACK
    return dealer if dealer.points > player.points && dealer.points <= player.class::BLACK_JACK
    return dealer if player.points > player.class::BLACK_JACK
    return player if dealer.points > player.class::BLACK_JACK
  end

  def play_again?
    interface.play_again?
    choice = gets.chomp.to_i
    @status = case choice
              when 1
                1
              else
                0
              end
  end
end
