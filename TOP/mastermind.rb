# Replace colors with number codes
# Computer randomly selects 4 out of 6 numbers between 1-6
# Duplicates and blanks are not allowed
# 

class Mastermind
    TURNS = 8
    MIN = 1
    MAX = 6
    def start_game
        random_nums = get_numbers
        puts random_nums.join(' ')
        idx = 0
        flag = false
        while idx < TURNS
            puts "Your turn. Enter space separated numbers"
            code = gets.chomp.split(/\s+/).map { |n| n.to_i }
            # Handle for wrong inputs as well
            if !validate_input(code)
                puts "Invalid Input, please retry"
                next
            end
            result = verfiy_code(random_nums, code)
            flag = true if(result.join('') === 'RRRR')
            break if flag
            puts result.join(' ')
            idx += 1
        end

        if flag
            puts "Congratulations, You have solved the code" 
        else
            puts "Sorry, you lost the challenge"
        end
    end

    def get_numbers
        arr = (1..6).to_a
        arr.sample(4)
    end

    def validate_input(code)
        return false if code.max > MAX || code.min < MIN
        return false if code.length != 4
        true
    end

    def verfiy_code(actual_code, user_code)
        result = []
        arr = Array.new(actual_code)
        user_code.each_with_index do |num, idx|
            if (num === arr[idx])
                result.push('R');
                arr[idx] = -1;
            elsif (arr.include?(num))
                result.push('P');
                arr[idx] = -1;
            else
                result.push('W');
            end
        end
        result
    end
end

master = Mastermind.new
master.start_game