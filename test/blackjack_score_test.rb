require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! 
Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do
    hand = [3, 4]
    score = blackjack_score(hand)
    expect(score).must_equal 7
  end
  
  it 'facecards have values calculated correctly' do
    hand = [3, 'Jack']
    score = blackjack_score(hand)
    expect(score).must_equal 13
  end
  
  it 'calculates aces as 11 where it does not go over 21' do
    hand = ['Ace', 10, 10]
    score = blackjack_score(hand)
    expect(score).must_equal 21
  end
  
  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    hand = ['Ace', 'Jack', 9]
    score = blackjack_score(hand)
    expect(score).must_equal 20
  end
  
  it 'raises an ArgumentError for invalid cards' do
    hand = ['JOKER']
    
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError
    
  end
  
  it 'raises an ArgumentError for scores over 21' do
    hand = [3, 'Jack', 'Queen']
    
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError
    
  end
end
