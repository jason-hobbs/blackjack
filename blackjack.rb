require 'pry'

suits = ['Clubs', 'Hearts', 'Spades', 'Diamonds']

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

bust = nil
winner = nil

player_total = 0
house_total = 0

def card_picks(s, c, tot, who)
  card_suite = s.sample
  card_num = c.sample
  if card_num.is_a? String
    tot += 10
  else
    tot += card_num
  end
  puts "#{who} receives the #{card_num} of #{card_suite}"
  return tot
end

def hit_stay(suits, cards, player_total)
  puts "Would you like to Hit or Stay? (H/S)"
  choice = gets.chomp
  if choice.downcase == 'h'
    player_total = card_picks(suits, cards, player_total, 'Player')
  end
  return player_total
end

def house_choice(suits, cards, house_total, player_total, bust, winner)
  if bust || winner
    return house_total
  end
  if house_total < 18 || house_total < player_total
    unless house_total > 21
      house_total = card_picks(suits, cards, house_total, 'House')
    end
  end
  return house_total
end

def show_total(p, h)
  puts "Player total so far is #{p}"
  puts "House total so far is #{h}"
end

def check_bust(p,h)
  if p > 21 && h > 21
    return 'both'
  elsif p > 21
    return 'Player'
  elsif h > 21
    return 'House'
  else
    return nil
  end
end

def check_winner(p,h,bust)
  if bust
    if bust == 'Player'
      puts "Player busted! House wins with #{h}"
      return 'House'
    elsif bust == 'House'
      puts "House busted! Player wins with #{p}"
      return 'Player'
    elsif bust == 'both'
      puts "House and Player both busted!"
      return 'both'
    end
  end
  if p == 21
    puts 'Player wins with 21!'
    return 'Player'
  elsif h == 21
    puts 'House wins with 21!'
    return 'House'
  end
  return nil
end


system 'clear'
puts "Let's play blackjack!"
2.times {player_total = card_picks(suits, cards, player_total, 'Player')}
2.times {house_total = card_picks(suits, cards, house_total, 'House')}
show_total(player_total, house_total)

begin
  player_total = hit_stay(suits, cards, player_total)
  house_total = house_choice(suits, cards, house_total, player_total, bust, winner)
  show_total(player_total, house_total)
  bust = check_bust(player_total, house_total)
  winner = check_winner(player_total, house_total, bust)
end until winner
