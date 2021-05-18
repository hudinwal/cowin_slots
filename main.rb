require_relative 'main_app_loop.rb'

# TODO use OptionParser
pincode =  Integer(ARGV[0])
min_age = Integer(ARGV[1])
type = ARGV[2] # types can be "Free" or "Paid"
days_to_check = 2 # 1 is today, 2 is today and tomorrow and so on

puts(loop_to_check_vaccine(days_to_check, pincode, min_age, type))