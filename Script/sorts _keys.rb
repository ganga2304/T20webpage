=begin
Write a method that sorts keys in a hash by length of key and return
the sorted hash.
=end
def sort_hash(hash)
  return hash.sort_by { |key, _| key.to_s.length }.to_h
end

hash = { "ruby" => 1, "java" => 2, "python" => 3, "c" => 4 }
sorted_hash = sort_hash(hash)
puts sorted_hash 