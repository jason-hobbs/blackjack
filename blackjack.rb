require 'pry'

suits = ['Clubs', 'Hearts', 'Spades', 'Diamonds']

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

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








system 'clear'
puts "Let's play blackjack!"
2.times {player_total = card_picks(suits, cards, player_total, 'Player')}
2.times {house_total = card_picks(suits, cards, house_total, 'House')}
puts "Player total so far is #{player_total}"
puts "House total so far is #{house_total}"

puts "Would you like to Hit or Stay? (H/S)"
choice = gets.chomp
if choice.downcase == 'h'
  player_total = card_picks(suits, cards, player_total, 'Player')
end
puts "Player total so far is #{player_total}"
