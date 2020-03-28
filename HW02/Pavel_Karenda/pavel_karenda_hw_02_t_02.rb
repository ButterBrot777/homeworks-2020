ERROR = /error/.freeze
IP = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/.freeze
DATE = %r{\d{1,2}/\w{3}/\d{4}\:\d{0,2}\:\d{0,2}\:\d{0,2}\s\+\d{4}}.freeze
DESTINATION = %r{/\w+/\d+/\w+\s}.freeze
arr_lines = []
# 23/Apr/2018:20:30:39 +0300
if ARGV.length != 1
  puts 'We need exactly one parameter. The name of a file.'
  exit
end
filename = ARGV[0]
puts "Going to open '#{filename}'"

file = File.open(filename)

def find_error(file, arr_lines)
  file.each do |line|
    arr_lines.push(line) unless line.match(ERROR)
  end
end

find_error(file, arr_lines)

def find_ip(arr)
  arr.map do |line|
    line.match(IP).to_s
  end
end

def find_date(arr)
  arr.map do |line|
    line.match(DATE).to_s
  end
end

def find_destination(arr)
  arr.map do |line|
    line.match(DESTINATION).to_s.upcase
  end
end

file.close

def print_result(arr)
  result = []
  date = find_date(arr)
  ip = find_ip(arr)
  destination = find_destination(arr)

  arr.length.times do |i|
    result.push("#{date[i]} FROM: #{ip[i]} TO: #{destination[i]}")
  end
  p result
end
print_result(arr_lines)
