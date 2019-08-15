VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  
  unless hand.class == Array
    raise ArgumentError.new("I NEED AN ARRAY")
  end
  
  if hand.length > 5
    raise ArgumentError.new("TOO MANY CARDS")
  elsif hand.length < 2
    raise ArgumentError.new("I NEED AT LEAST 2 CARDS")
  end
  
  # add up scores
  score_hash = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => [1,11] }
  score = 0
  qty_aces = 0
  
  hand.each do |card|
    unless card.class == Integer
      card = card.capitalize
    end
    
    unless VALID_CARDS.include? card
      raise ArgumentError.new("INVALID CARD: #{card}")
    else 
      # assign numerical value and add to running score
      if card == "Ace"
        # set aside for now, decide on value at the end
        qty_aces += 1
      else
        value = score_hash[card]
        score += value
      end
    end
  end
  
  # decide on value(s) of Ace(s)
  qty_aces.times do |index|
    if score + 10 <= (20 - index)    # b/c 21-(index+1) = 20
      score += 10
    else
      score += 1
    end
  end
  
  raise ArgumentError.new("BUST!") if score > 21
  
  return score
end
