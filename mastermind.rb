# frozen_string_literal: true

# Use Mastermind to play master mind
class MasterMind
  attr_reader :answer, :guess

  def initialize(num)
    @answer = num.to_s.rjust(4,'0').split('')
    @guess = []
  end

  def greeting
    puts '=========================='
    puts 'Welcome to Mastermind Game '
    puts 'Guess the 4 digits number to win!'
    puts '=========================='
  end

  def guess=(num)
    @guess = num.to_s.split('')
  end

  def answer=(num)
    @answer = num.to_s.split('')
  end

  def check_win
    answer.length.times.all? { |position| answer[position] == guess[position] }
  end

  def check_clue 
    puts '==========================='
    puts 'Clue:'
    answer.length.times do |position|
      if answer[position] == guess[position]
        puts "position:#{position} in correct position"
      elsif answer.include?(guess[position])
        puts "position:#{position} not in correct position"
      else
        puts "position:#{position} dont have this num!"
      end
    end
    puts '==========================='
  end

  def display_position
    display_array = [%w[0 1 2 3]] << guess
    header = ['position', 'guess   ']
    display_array = display_array.each_with_index.map do |row ,index|
      cells = row.map do |col|
        col.center(5, ' ')
      end
      cells = [header[index]] + cells
      cells.join('|')
    end
    puts '==========================='
    puts display_array
    if check_win == true
      puts '==========================='
      puts "You Are Right! Answer is -----> #{answer.join}"
      puts '==========================='
      exit
    else
      check_clue
    end
  end
end

def not_num?(string_num)
  Integer(string_num.to_i.to_s)
  false
rescue ArgumentError
  true
end

user_input = ''
random_num = rand(1000)
mastermind = MasterMind.new(random_num)
mastermind.greeting
while mastermind.check_win == false
  printf 'Guess 4 number:'
  user_input = gets.chomp
  while user_input == '' || user_input.length != 4 or not_num?(user_input) do
    printf 'Guess 4 number:'
    user_input = gets.chomp
  end
  mastermind.guess = user_input
  mastermind.display_position
end
