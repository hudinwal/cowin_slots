require 'optparse'
require_relative 'main_app_loop.rb'

ARGV << '-h' if ARGV.empty?

options = {}
OptionParser.new do |opts|
  opts.banner = "Script to speak out, when a vaccine at given pin code is available.
  Usage: main.rb [options], eg main.rb -t Free -a 18 -p 301001"

  opts.on('-p', '--pincode PINCODE', Integer, '[Required] Pincode to check for') { |p| options[:pincode] = p }
  opts.on('-a', '--age AGE', Integer, '[Required] Minimum age to check for') { |a| options[:min_age] = a }
  opts.on('-t', '--type TYPE', String, '[Required] Type of vaccine to check for, can be "Free" or "Paid"') { |t| options[:type] = t }
end.parse!

pincode =  options[:pincode]
min_age = options[:min_age]
type = options[:type]

if pincode.nil? or min_age.nil? or type.nil?
    puts "Required options is/are missing. Please check help."
    exit
end

puts(loop_to_check_vaccine(pincode, min_age, type))