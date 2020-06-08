class User
  BANK = 100
  RATE = 10
  MAX_CARDS = 3
  BLACK_JACK = 21

  attr_reader :name, :balance, :points, :cards

  def initialize(name)
    @name = name
    @balance = BANK
    @cards = []
    @points = 0
  end

  def take_card(desk)
    card = desk.take_card
    ace_calculate if card.value == 1
    @points += card.value
    @cards << card
  end

  def can_take?
    cards.length < MAX_CARDS
  end

  def can_play?
    balance >= RATE
  end

  def bet
    @balance -= RATE
  end

  def win_bank
    @balance += RATE * 2
  end

  def clear
    card.clear
  end

  private

  def ace_calculate
    @points += @points + 11 <= BLACK_JACK ? 11 : 1
  end
end
