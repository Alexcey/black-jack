require_relative 'user.rb'

class Interface
  def initialize
    start
  end

  def print_state(player, dealer)
    puts "Bank #{player.name}: #{player.balance}. Bank dealer: #{dealer.balance}"
  end

  def print_bet(value)
    puts "Bets are made. Bank #{2 * value}."
  end

  def print_cards(player, show_card)
    print "#{player.name} cards: "
    show_card ? (puts print_card(player)) : (puts '* - * * - *')
  end

  def print_card(player)
    player.cards.map { |card| card.name + ' ' }
  end

  def print_point(player)
    puts "#{player.name} points: #{player.points}"
  end

  def print_card_last(player, show_card)
    print "#{player.name} card: "
    show_card ? (puts player.cards.last.name) : (puts '* - *')
  end

  def print_winner(player)
    puts "#{player.name} win!"
  end

  def draw
    puts 'Draw!'
  end

  def round_choice
    puts 'Choice act:'
    puts '1 - Pass'
    puts '2 - More one.'
    puts '3 - Open card.'
  end

  def play_again?
    puts 'Game over! Next?'
    puts '1 - Yes'
    puts '2 - No'
  end

  private

  def start
    puts 'The game begins'
    puts 'Enter your name'
  end
end
