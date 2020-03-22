class AngleCalculator
    attr_reader :hours, :minutes
    
    def initialize(hours, minutes)
        @hours = hours
        @minutes = minutes
    end
    
    def calc_angle
        result = ((60 * hours + minutes) / 2 - 6 * minutes).abs
        if result > 180
            result = 360 - result
        end
        return result
    end
    
end


p 'This prgram is to calculate angle between hours and minutes hands'
def geting_data_from_user
    def put_hours
        p 'Please, enter hours from keyboard:'
        hours = gets.chomp.to_i
        if (hours < 0 || hours > 12)
            p 'wrong input! Please write the number in range 0...12'
            put_hours
        else return hours
        end
    end
    def put_minutes
        p 'Please, enter minutes from keyboard:'
        minutes = gets.chomp.to_i
        # input_data.hours = hours
        if (minutes < 0 || minutes > 59)
            p 'wrong input! Please write the number in range 0...59'
            put_minutes
        else return minutes
        end
    end
    
end
hours = geting_data_from_user.put_hours
minutes = geting_data_from_user.put_minutes

p "Answer: #{AngleCalculator.new(hours, minutes).calc_angle} grad"
