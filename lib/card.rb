class Card
  attr_reader :value,
              :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def correct_card
    "#{@value} of #{@suit}"
  end

  def numeric_value
    value_map = {
      "Ace" => 14,
      "King" => 13,
      "Queen" => 12,
      "Jack" => 11
    }
    value_map[@value] || @value.to_i
  end
end
