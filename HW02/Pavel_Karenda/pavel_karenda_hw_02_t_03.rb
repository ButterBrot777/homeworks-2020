require 'time_difference'
require 'time'

CORE = /Calling core with action/.freeze
DATE = /^([0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]*.[0-9])/.freeze
arr_lines = []

if ARGV.length != 1
  puts 'We need exactly one parameter. The name of a file.'
  exit
end
filename = ARGV[0]
puts "Going to open '#{filename}'"

fh = File.open(filename)

fh.each do |line|
  arr_lines.push(line) if line.match(CORE)
end
fh.close

def input_start_validity(arr)
  return unless arr.length.zero?

  p 'input has no paramethers'
  exit
end
input_start_validity(arr_lines)

def get_date_from_line(arr_lines)
  arr_lines.map! do |elem|
    Time.parse(elem.match(DATE).to_s)
  end
  p arr_lines
  p arr_lines.length
end
get_date_from_line(arr_lines)

def calc_time(arr_lines)
  diff_time = []
  (arr_lines.length - 1).times do |i|
    start_time = arr_lines[i]
    end_time = arr_lines[i + 1]
    res = TimeDifference.between(start_time, end_time).in_seconds.round(1)
    diff_time.push(res)
  end
  p "number of actions: #{arr_lines.length}"
  p "duration between actions: #{diff_time}"
end
calc_time(arr_lines)
