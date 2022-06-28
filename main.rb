require './validity_checks'

prior_guesses = []

def generate_number()
  secret_number = []
  numbers_added = 0
  while numbers_added < 4
    number = rand(1..6).to_s
    if !secret_number.include?(number)
        secret_number[numbers_added] = number
        numbers_added +=1
    end
  end
  secret_number
end

def input_guess()
    puts "Input four numbers between 1 and 6 to make a guess. No number will be used twice. (ex. 1234):"
    
    valid_guess = false

    while !valid_guess
      guess = gets.strip
      guess = guess.split('')

      if correct_length(guess) && within_range(guess) && any_duplicates?(guess)
        valid_guess = true
      else
        puts "Invalid guess. Try again, guess must be four numbers between 1 and 6, no repeats. (ex. 1234):"
      end
    end
    guess
end

def check_guess(number, guess)
    hint = ['X', 'X', 'X', 'X']
    correct_order = 0
    correct_number = 0
    index = 0

    number.each_with_index do |num, x|
      if guess.include?(num)
        if guess[x] == number[x]
          correct_order+=1
        else
          correct_number+=1
        end
      end
    end

    correct_order.times do
      hint[index] = '@'
      index+=1
    end

    correct_number.times do
      hint[index] = 'O'
      index+=1
    end
    return hint.join
end

def play_game()
    secret_code = generate_number()
    correct_answer = false
    index = 0

    while !correct_answer && index < 12
        puts "Guess Number #{index + 1}:"
        guess = input_guess()
        puts "Result:"
        hint = check_guess(secret_code, guess)
        puts "#{hint}"
        puts ""
        index+=1

        if hint == "@@@@"
            correct_answer = true
        end
    end

    if correct_answer == true
        puts "You win! The code was #{secret_code}"
    else
        puts "You lose. The code was #{secret_code}"
    end
end

#generate_number()
#input_guess()
#check_guess(['1','2','3','4'], ['1','6','3','4'])
#play_game()