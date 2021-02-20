#!/usr/bin/env ruby
require_relative '../lib/settings'
require_relative '../lib/logic'
include Player
def players(sign)
  state = true
  while state
    if Player.sign_validate(sign)
      puts "player #{sign} make the move"
      break
    else
      puts 'enter the correct value'
      sign = gets.chomp
    end
  end
  sign
end

def move_check(move, array, var)
  state = true
  while state
    if Player.move_validate(move) && Player.index_taken(move - 1, array)
      array[move - 1] = var
      break
    else
      puts 'enter the correct value'
      move = gets.chomp.to_i
    end
  end
end
b = Settings.new
array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts 'choose the player (1 is x) or (2 is o)'
sign = gets.chomp
sign = players(sign)
i = 0
while i < 9
  move = gets.chomp.to_i
  move_check(move, array, sign)
  puts b.draw_board(array).to_s
  if Player.wins(array, sign)
    puts "player #{sign} wins \u{1F911}"
    break
  end
  if i == 8
    Player.draw
    break
  end
  sign = Player.flip_user(sign)
  puts "player #{sign} make the move"
  i += 1
end
