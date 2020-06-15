require_relative 'card.rb'
class User
  BANK = 100
  RATE = 10
  MAX_CARDS = 3
  BLACK_JACK = 21

  attr_reader :name, :balance, :points, :cards, :ace, :calc_point
  attr_accessor :points

  def initialize(name)
    @name = name
    @balance = BANK
    @cards = []
    @points = 0
    @calc_point = 0
    @ace = true
  end

  def take_card#(desk)
    card = desk.take_card
    @ace = false if card.value == 1
    @points += card.value
    @cards << card
  end

  def ace?
    @ace
  end

  def calc_points
    @calc_point = points
    return calc_point if ace?
    return @calc_point += 10 if @calc_point + 10 <= BLACK_JACK
    calc_point
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
