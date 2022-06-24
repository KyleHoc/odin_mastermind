def correct_length(guess)
    valid = false
    if guess.length == 4
        valid = true
    end
    return valid
end

def within_range(guess)
    valid = false
    correct_values = 0
    4.times do |x|
        if guess[x].to_i > 0 && guess[x].to_i < 7
            correct_values += 1
        end
    end
    if correct_values == 4
        valid = true
    end
    return valid
end

def any_duplicates?(guess)
    valid = true

    guess.each do |num|
        unless guess.count(num) == 1
            valid = false
            break
        end
    end
    return valid
end