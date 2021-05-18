require_relative 'get_vaccine_centers.rb'
require_relative 'vaccine_available_in_centers.rb'

def loop_to_check_vaccine(pincode, age, type)
    10000.times do |n|
        puts("Attempt ##{n+1}")
        today = Date.today 
        available = check_availability_for_date(today, pincode, age, type)
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