class Deck
  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end

  def count
    @cards.count
  end

  def sort
    n = cards.length
    loop do
      swapped = false
      (n-1).times do |i|
        if cards[i].numeric_value > cards[i + 1].numeric_value
          cards[i], cards[i + 1] = cards[i + 1], cards[i]
          swapped = true
        end
      end
      break if swapped == false
    end
    cards
  end

  def merge_sort
    if cards.length <= 1
      cards
    else
      mid = (cards.length / 2).floor
      left = merge_sort.cards[0..mid - 1]
      right = merge_sort.cards[mid..cards.length]
      merge(left, right)
    end
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first < right.first
      [left.first] + merge(left[1..left.length], right)
    else
      [right.first] + merge(left, right[1..right.length])
    end
  end
end
