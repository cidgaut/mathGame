# game class that generates game rules, math, question/answers, and keeps track of player turn.

class Game
  def initialize
    @players = [Player.new("Player 1"), Player.new("Player 2")]
    @current_player_turn = 0
  end

  def current_player
    @players[@current_player_turn]
  end

  def switch_player
    @current_player_turn = 1 - @current_player_turn
  end

  def question_generator
    num1 = rand(1..20)
    num2 = rand(1..20)
    { question: "#{num1} + #{num2}", answer: num1 + num2 }
  end

  def ask_question
    question = question_generator
    puts "#{current_player.name}: #{question[:question]}"
    player_answer = gets.chomp.to_i

    if player_answer == question[:answer]
      puts "That's right #{current_player.name}!"
    else
      puts "Nope. #{current_player.name} you just lost a life."
      current_player.lose_life
    end
  end

  def display_scores
    puts "Scores:"
    @players.each { |player| puts "#{player.name}: #{player.lives} lives" }
    puts "******END OF TURN*******"
  end

  def game_over
    @players.any? { |player| player.lives <= 0 }
  end

  def winner_declaration
    winner = @players.find { |player| player.lives > 0 }
    puts "Congratulations #{winner.name}, you won! Game results:"
    display_scores
  end

  def start
    until game_over
      ask_question
      display_scores
      switch_player
    end

    winner_declaration
  end
end

