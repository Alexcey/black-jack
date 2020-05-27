class Blackjack
  BALANCE_PLAEYR = 100
  BALANCE_DEALER = 100

  def start
    begin_game
  end

  def begin_game
    puts 'Enter your name'
    name = gets.chomp.to_s
    puts 'The game begins'
    puts "Your bank: #{BALANCE_PLAEYR}$. Dealer bank: #{BALANCE_DEALER}$."
  end
end
