require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Create two players 
player1 = Player.new('Nino')
player2 = Player.new('Josiane')
puts ""
# Show state of both players
while player1.life_points >= 0 && player2.life_points >= 0
puts "Voici l'état de chaque joueur.euse :"
puts ""
player1.show_state
player2.show_state
puts ""
# The game starts 
puts "Passons à la phase d'attaque :"
player1.attacks(player2)
player2.attacks(player1)

puts "Passons à la phase d'attaque !"
  player1.attacks(player2)
  player1.life_points > 0 ? player1.attacks(player2) : break
end

puts ""

binding.pry