require_relative 'my_each'
require_relative 'my_map'
require_relative 'my_select'

class Array
  attr_reader :arr
  def initialize(arr)
    @arr = arr
  end

  include CustomEach
  include CustomMap
  include CustomSelect
end

my_arr = Array.new([0, 1, 2, 3])

my_arr.arr.my_each { |elem| elem + 1 }
my_arr.arr.my_each

my_arr.arr.my_map { |elem| elem + 2 }
my_arr.arr.my_map

my_arr.arr.my_select { |elem| elem unless elem.zero? }
my_arr.arr.my_select
