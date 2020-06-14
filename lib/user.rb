class User
  BANK = 100
  RATE = 10
  MAX_CARDS = 3
  BLACK_JACK = 21

  attr_reader :name, :balance, :points, :cards, :ace

  def initialize(name)
    @name = name
    @balance = BANK
    @cards = []
    @points = 0
    @ace = true
  end

  def take_card(desk)
    card = desk.take_card
    @ace = false if card.value == 1
    @points += card.value
    @cards << card
  end

  def ace?
    @ace
  end

  def calc_points
    return points if ace?
    @points -= 1
    @points + 11 <= BLACK_JACK ? (@points += 11) : (@points += + 1)
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

  def draw
    @balance += RATE
  end

  def clear
    cards.clear
    @points = 0
  end
end
