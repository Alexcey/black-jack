class Desk
  SUITS = %w[♠ ♥ ♣ ♦]
  PICTURES = %w[Валет Дама Король]

  def initialize
    @desk_of_card = []
    reset_desk_of_card
  end

  def reset_desk_of_card
    @desk_of_card.clear
    generate_desk
    shuffle_desk_of_card
  end

  private

  def generate_desk
    SUITS.each do |suit|
      @desk_of_card.push(Card.new(1, "Туз - #{suit}"))

      (2..10).each do |value|
        @desk_of_card.push(Card.new(value, "#{value} - #{suit}"))
      end

      PICTURES.each do |picture|
        @desk_of_card.push(Card.new(10, "#{picture} - #{suit}"))
      end
    end
  end

  def shuffle_desk_of_card
    @desk_of_card.shuffle!
  end
end
