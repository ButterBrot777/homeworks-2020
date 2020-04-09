module CustomEach
  def my_each
    if block_given?
      (0...(length)).each do |i|
        yield(self[i])
      end
    else
      self
    end
  end
end
