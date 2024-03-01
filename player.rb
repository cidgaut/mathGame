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
end
