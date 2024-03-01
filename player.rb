# player class file that holds player name and keeps track of lives

class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -=1
  end

  def player_score
    "#{name}: #{lives} lives"
  end
end

player1 = Player.new("Player 1")
puts player1.player_score
player1.lose_life
puts player1.player_score
player1.lose_life
puts player1.player_score
player1.lose_life
puts player1.player_score