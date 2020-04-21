require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Accueil du jeu
puts "**********************************************************"
puts " "
puts "w_e_l_c_o_m_e t_o 'j_e f_a_i_s m_a_l à l_a t_ê_t_e'"
puts " "
puts "**********************************************************"

#Initialisation des players 
puts "Enter your players name"
human_player_name = gets.chomp 
human_player = HumanPlayer.new("#{human_player_name}")

#Initialisation des ennemis
player1 = Player.new("Nino")
player2 = Player.new ("Coco")
ennemis = [player1, player2] 

#Le combat
puts "Voici l'état de chaque joueur.euse :"
puts ""
human_player.show_state

puts "La partie est finie !" 

if human_player.life_points > 0 
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Oups tu as perdu !"  
end  

#Le menu de jeu 
def menu(human_player, player1, player2)
  while player1.life_points >= 0 || player2.life_points >= 0 && human_player.life_points >= 0
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""

    puts "attaquer player en vue :"
      if player1.life_points > 0
        puts "0 - #{player1.name} a #{player1.life_points} points de vie"
      end

      if player2.life_points > 0
        puts "1 - #{player2.name} a #{player2.life_points} points de vie"
      end

      #Faire un choix parmi les options disponibles dans le menu
      gets.chomp.to_s = human_player_choice
      
      if human_player_choice == "a"
        return HumanPlayer.search_weapon
      elsif human_player_choice == "s"
        return HumanPlayer.search_health_pack  
      elsif human_player_choice == "0"
        return human_player.attacks(player1)
      else human_player_choice == "1"
        return human_player.attacks(player2)
      end
  # The ennemies attack you
      ennemis.each do |ennemy|
        if ennemy.life_points >= 0
          puts "Les autres joueurs t'attaquent !"
          ennemy.attacks(human_player)
        end
      end
  end 
puts "La partie est finie"

end

binding.pry


