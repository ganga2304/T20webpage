def custom_map(array)
  total = []
  array.each do |num|
    total << yield(num)
  end 
  total
end
array = [1, 2, 3, 4, 5]
doubled_array = custom_map(array) { |num| num-1}
puts doubled_array