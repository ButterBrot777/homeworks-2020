module CustomSelect
  def my_select
    result = []
    if block_given?
      my_each do |elem|
        result.push(elem) if yield(elem)
      end
    end
    return self if result.length.zero?

    result
  end
end
