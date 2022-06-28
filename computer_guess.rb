require './validity_checks'
require './main'

def input_code()
    puts "Input four numbers between 1 and 6 to make a code. No number will be used twice. (ex. 1234):"
    
    valid_code = false

    while !valid_code
      code = gets.strip
      code = code.split('')

      if correct_length(code) && within_range(code)
        valid_code = true
      else
        puts "Invalid code. Try again, code must be four numbers between 1 and 6, no repeats. (ex. 1234):"
      end
    end
    code
end

def guess(code)
    #possible_numbers = []
    #index = 1111
    #guess = 1111
    #correct_guess = false
    

    #while index < 6667
        #if within_range(index.to_s.split(''))
            #possible_numbers.push(index)
        #end
        #index+=1
    #end
    attempts = 6
    filter_guesses = [1111, 2222, 3333, 4444, 5555, 6666]
    has_number = [0, 0, 0, 0, 0, 0]
    code_arr = []

    filter_guesses.each_with_index do |num, index|
      hint = check_guess(code, num.to_s)
      has_number[index] = hint.count('@') + hint.count('O')
    end

    has_number.each_with_index do |num, index|
      while num > 0
        code_arr.push(index+1)
        num = num - 1
      end
    end

    possible_codes = code_arr.permutation(4).to_a

    possible_codes.each do |guess|
      attempts+=1
      if code.join == guess.join
        puts "Congrats, you won! The code is #{guess}"
        break
      end
    end
    puts attempts
end
guess(1656.to_s.split(''))

#possible_numbers.each do |num|
          #sub_hint = check_guess(code, num.to_s.split(''))
          #if main_hint == sub_hint
              #possible_numbers.delete(num)
          #end
      #end

=begin
      possible_numbers.delete_if {|num| !num.include?(guess.arr[0]) && !num.include?(guess.arr[1]) && !num.include?(guess.arr[2]) && !num.include?(guess.arr[3])}

      possible_numbers.each do |num|
        key = num.to_s.split('')
      if !key.include?(guess_arr[0]) && !key.include?(guess_arr[1]) && !key.include?(guess_arr[2]) &&  !key.include?(guess_arr[3])
        possible_numbers.delete(num)
      end
    end

    possible_numbers.each do |num|
        key = num.to_s.split('')
      if !key.include?(guess_arr[0]) || !key.include?(guess_arr[1]) || !key.include?(guess_arr[2]) ||  !key.include?(guess_arr[3])
        possible_numbers.delete(num)
      end
    end

    possible_numbers.each_with_index do |num|
        key = num.to_s.split('')
        if key.include?(guess_arr[0]) || key.include?(guess_arr[1]) || key.include?(guess_arr[2]) ||  key.include?(guess_arr[3])
          possible_numbers.delete(num)
        end
      end


while !correct_guess
      main_hint = check_guess(code, guess.to_s.split(''))
      hint_arr = main_hint.split('')
      guess_arr = guess.to_s.split('')
      code_present = 0

      if main_hint == "@@@@"
        correct_guess = true
        puts "winner"
        puts guess
        break
      end

      hint_arr.each do |x|
        if x == '@' || x == 'O'
            code_present+=1
        end
      end

      possible_numbers.delete(possible_numbers[0])
      if code_present == 4
        possible_numbers.delete_if {|num| !num.to_s.include?(guess_arr[0]) && !num.to_s.include?(guess_arr[1]) && !num.to_s.include?(guess_arr[2]) && !num.to_s.include?(guess_arr[3])}
      elsif code_present > 0
        possible_numbers.delete_if {|num| !num.to_s.include?(guess_arr[0]) || !num.to_s.include?(guess_arr[1]) || !num.to_s.include?(guess_arr[2]) || !num.to_s.include?(guess_arr[3])}
      elsif code_present == 0
        possible_numbers.delete_if {|num| num.to_s.include?(guess_arr[0]) || num.to_s.include?(guess_arr[1]) || num.to_s.include?(guess_arr[2]) || num.to_s.include?(guess_arr[3])}
      end
      guess = possible_numbers[0]
    end

=end