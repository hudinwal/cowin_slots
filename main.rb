require_relative 'get_vaccine_centers.rb'
require_relative 'vaccine_available_in_centers.rb'

def loop_to_check_vaccine(days, pincode, age, type)
    10000.times do |n|
        puts("Attempt ##{n+1}")
        available = check_availability_for_next_days(days, pincode, age, type)
        if available 
            notify
        end
        sleep 5
    end
    return false
end

def notify
    `say "Hi! Vaccine is Available!"`
end

# 0 days check for today, 1 days check for today and tomorrow
def check_availability_for_next_days(days, pincode, age, type)
    today = Date.today 
    (0..days-1).each do |n|
        date = today + n
        available = check_availability_for_date(date, pincode, age, type)
        if available
            return available
            break
        end
    end
    return false
end

def check_availability_for_date(date, pincode, age, type)
    puts("Checking vaccine - Pincode: #{pincode}, Date: #{date}")
    begin
        response = get_vaccine_centers(pincode, date)
    rescue Exception
        puts("Failed!")
        return false
    end
    result = vaccine_available_in_centers(response.body["centers"], age, type)
    puts("Result - Available: #{result.count > 0}, Result: #{result}")
    if result.count > 0
        puts("All centers - #{response.body["centers"]}")
    end
    result.count > 0
end

# TODO use OptionParser
pincode =  Integer(ARGV[0])
min_age = Integer(ARGV[1])
type = ARGV[2] # types can be "Free" or "Paid"
days_to_check = 2 # 1 is today, 2 is today and tomorrow and so on

puts(loop_to_check_vaccine(days_to_check, pincode, min_age, type))