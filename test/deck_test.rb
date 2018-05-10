require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def test_a_deck_has_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_count_cards_in_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal 3, deck.count
  end

  def test_it_can_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("10", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("King", "Hearts")
    deck = Deck.new([card_1, card_2, card_3, card_4])

    assert_equal [card_1, card_3, card_2, card_4], deck.sort
  end

  def test_it_can_merge_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("King", "Hearts")
    deck = Deck.new([card_1, card_2, card_3, card_4])

    assert_equal [card_2, card_1, card_3, card_4], deck.merge_sort
  end
end
