require 'pry'

class Player
  attr_accessor :name, :life_points

  #méthode qui initialize les variables d'instance de la classe Player
  def initialize(name) 
    @name = name
    @life_points = 10
  end

  #méthode qui montre le nombre de vies restant au player
  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  #méthode qui calcule le nombre de vies perdues
  def gets_damage(minus_lives)
    @life_points -= minus_lives
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  #méthode qui attaique et enlève des vies 
  def attacks (attacked_player)
    puts "#{@name} attaque #{attacked_player.name}"
    damage = compute_damage #on relie le code à la méthode compute_damage et lui attribue une variable damage
    attacked_player.gets_damage(damage) #on relie le code à la méthode gets_damage
    if attacked_player.life_points > 0
      puts  "il.elle lui inflige #{damage} points de dommages !"
    else
      exit
    end
  end  

  #méthode qui établit le nombre de coups que va recevoir le player
  def compute_damage
    return rand(1..6)
  end
#binding.pry 
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name)
    super(name) #fait appel au initialize de la classe Player
    @life_points = 100
    @weapon_level = 1
  end  

  #méthode qui montre le nombre de vies restant au player
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  #méthode qui établit le nombre de coups que va recevoir le player en fonction 
  def compute_damage
    rand(1..6) * @weapon_level # inflige des dégâts compris entre [@weapon_level] et [6 x @weapon_level]
  end

  #méthode qui permet d'obtenir une nouvelle arme, d'un niveau supérieur 
  def search_weapon 
    new_weapon_level = rand(1..6) 
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
    if @weapon_level < new_weapon_level
       @weapon_level = new_weapon_lvl #pas sûre que ce soit la bonne méthode ? 
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends. Ton arme est de #{new_weapon_level} "
    else
      puts  "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end 
  end   

  #méthode qui permet d'obtenir un pack de points de vie afin de faire remonter leur niveau de vie
  def search_health_pack 
    health_pack = rand(1..6)
    if health_pack == 1 
      puts "Tu n'as rien trouvé..."
    elsif  health_pack >= 2 && health_pack <= 5
      new_life_points = @life_points + 50 #comme dans weapon, on définit une nouvelle entrée
      #je ne sais pas comment mettre une limite à 100...
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else health == 6 
      @life_points +=80 # augmenter sa vie de 80 points mais sans qu'elle puisse dépasser 100 points
      puts  "Waow, tu as trouvé un pack de +80 points de vie !"
    end  
  end  

 #binding.pry 
end   