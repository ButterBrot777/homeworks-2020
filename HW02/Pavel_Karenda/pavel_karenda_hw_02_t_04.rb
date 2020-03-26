# this program counts letters and digits in a string
def task_4(input)
  letters_counter = 0
  digits_counter = 0
  input.chars.each do |elem|
    if elem.match?(/\d/)
      digits_counter += 1
    elsif elem.match?(/\w/)
      letters_counter += 1
    end
  end
  p "the string '#{input}' contains #{letters_counter} letters and
    #{digits_counter} digits"
end

task_4('hel2!lo ..!#.')
