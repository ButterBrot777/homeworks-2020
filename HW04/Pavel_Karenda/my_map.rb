module CustomMap
  def my_map
    result = []
    my_each do |elem|
      result.push(yield(elem)) if block_given?
    end
    return self if result.length.zero?

    result
  end
end
