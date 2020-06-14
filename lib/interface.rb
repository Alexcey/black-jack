class Interface
  attr_reader :game

  def initialize(game)
    @game = game
    ask_name
    new_game
  end

  def ask_name
    puts 'Input your name:'
    name = gets.chomp.to_s
    game.create_player(name)
  end

  def new_game
    main_menu
    case gets.to_i
    when 1
      start
    when 2
      exit
    end
  end

  def start
    print_state
    game.play
    print_bet(game.player.class::RATE)
    print_cards(game.player, true)
    print_point(game.player)
    print_cards(game.dealer, false)
    round
  end

  def round
    game_menu
    case gets.to_i
    when 1
      dealer_act
    when 2
      player_take_card
    when 3
      open_cards
    end
    play_again?
  end

  def dealer_act
    dealer_take_card if game.dealer.calc_points < game.dealer.class::DEALER_STOP
    open_cards
  end

  def player_take_card
    game.player_take_card
    print_card_last(game.player, true)
    print_point(game.player)
    dealer_act
  end

  def open_cards
    print_cards(game.dealer, true)
    print_point(game.dealer)
    game.result == 'draw' ? draw : print_winner(game.winner)
  end

  def dealer_take_card
    print_cards(game.dealer, true)
    game.dealer_take_card
    print_card_last(game.dealer, false)
  end

  def winner_user(player)
    print_winner(player)
  end

  def draw
    draw
  end

  def print_cards(player, show_card)
    puts "#{player.name} cards: "
    show_card ? (puts print_card(player)) : (puts '* - * * - *')
  end

  def print_card(player)
    player.cards.map { |card| card.name + ' ' }
  end

  def print_point(player)
    puts "#{player.name} points: #{player.calc_points}"
  end

  def print_card_last(player, show_card)
    print "#{player.name} add card: "
    show_card ? (puts player.cards.last.name) : (puts '* - *')
  end

  def print_winner(player)
    puts "#{player.name} win!"
  end

  def draw
    puts 'Draw!'
  end

  def play_again?
    play_again
    case gets.to_i
    when 1
      start
    when 2
      exit
    end
  end

  private

  def print_state
    game.players.each { |user| print_bank(user) }
  end

  def print_bank(user)
    puts "Bank #{user.name}: #{user.balance}."
  end

  def print_bet(value)
    puts "Bets are made. Bank #{2 * value}."
  end

  def main_menu
    puts '1 - New game'
    puts '2 - Exit'
  end

  def game_menu
    puts 'Choice act:'
    puts '1 - Pass'
    puts '2 - More one.'
    puts '3 - Open card.'
  end

  def play_again
    puts 'Game over! Next?'
    puts '1 - Yes'
    puts '2 - No'
  end
end
