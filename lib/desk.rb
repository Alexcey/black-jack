require_relative 'card.rb'

class Desk
  attr_reader :desk_of_card

  SUITS = %w[♠ ♥ ♣ ♦].freeze
  PICTURES = %w[Jack Queen King].freeze

  def initialize
    @desk_of_card = []
    reset_desk_of_card
  end

  def reset_desk_of_card
    desk_of_card.clear
    generate_desk
    shuffle_desk_of_card
  end

  def take_card
    desk_of_card.pop
  end

  private

  def generate_desk
    SUITS.each do |suit|
      desk_of_card.push(Card.new(1, "Ace - #{suit}"))

      (2..10).each do |value|
        desk_of_card.push(Card.new(value, "#{value} - #{suit}"))
      end

      PICTURES.each do |picture|
        desk_of_card.push(Card.new(10, "#{picture} - #{suit}"))
      end
    end
  end

  def shuffle_desk_of_card
    desk_of_card.shuffle!
  end
end
