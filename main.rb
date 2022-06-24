require './validity_checks'

prior_guesses = []

def generate_number()
  secret_number = []
  numbers_added = 0
  while numbers_added < 4
    number = rand(1..6)
    if !secret_number.include?(number)
        secret_number[numbers_added] = number
        numbers_added +=1
    end
  end
  secret_number = secret_number.join
end

def input_guess()
    puts "Input four numbers between 1 and 6 to make a guess. No number will be used twice. (ex. 1234):"
    
    valid_guess = false

    while !valid_guess
      guess = gets.strip
      guess_check = guess.split('')

      if correct_length(guess_check) && within_range(guess_check) && any_duplicates?(guess_check)
        valid_guess = true
      else
        puts "Invalid guess. Try again, guess must be four numbers between 1 and 6, no repeats. (ex. 1234):"
      end
    end
    p guess
end

generate_number()
input_guess()