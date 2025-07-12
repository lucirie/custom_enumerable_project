module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0..self.length-1 do
      yield(self[i], i)
    end
    return self
  end

  def my_select
    modified_array = []
    self.my_each do |elem|
      modified_array << elem if yield(elem)
    end
    return modified_array
  end

  def my_all?
    self.my_each do |elem|
      return false if yield(elem) == false
    end
    return true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    return false
  end

  def my_none? 
    self.my_each do |elem|
      return false if yield(elem)    
    end
    return true
  end

  def my_count 
    if block_given?
      count = 0
      self.my_each { |elem| count += 1 if yield(elem) }
      return count
    end
    return self.length
  end

  def my_map
    modified_arr = Array.new()
    self.my_each { |elem| modified_arr << yield(elem) }
    return modified_arr
  end

  def my_inject(initial_value)
    memo = initial_value
    self.my_each do |elem|
      current_value = yield(memo, elem)
      memo = current_value
    end
    return memo
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each 
    for i in 0..self.length-1 do
       yield(self[i])
    end
    return self
  end
end
