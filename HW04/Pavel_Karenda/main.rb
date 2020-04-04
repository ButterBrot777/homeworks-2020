require_relative 'my_each'
require_relative 'my_map'
require_relative 'my_select'

class Array
  # attr_reader :arr
  
  # it doesn't work with constructor!!

  # def initialize(arr) 
  #   @arr = arr
  # end
  
  include CustomEach
  include CustomMap
  include CustomSelect
end

my_arr = Array.new([1, 2, 3])

[].my_each(my_arr) { |elem| p elem + 1 } # it works
my_arr.my_each(my_arr) { |elem| p elem + 1 } # it works but looks stupid
