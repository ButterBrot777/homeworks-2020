ERROR = /error/.freeze
arr_lines = []

if ARGV.length != 1
  puts 'We need exactly one parameter. The name of a file.'
  exit
end
filename = ARGV[0]
puts "Going to open '#{filename}'"

file = File.open(filename)

def find_error(file, arr_lines)
  file.each do |line|
    arr_lines.push(line) if line.match(ERROR)
  end
  arr_lines
end
p lines = find_error(file, arr_lines)
file.close

def print_error(arr_lines)
  if arr_lines.empty?
    p ''
  else arr_lines.each do |line|
         p line
       end
  end
end
print_error(lines)
