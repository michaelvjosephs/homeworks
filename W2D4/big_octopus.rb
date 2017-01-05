a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
new_tiles_data_structure = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }

def sluggish_octopus(arr)

  arr.each_with_index do |fish1, idx1|
    longest = fish1

    arr.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      longest = nil if fish2.length > fish1.length
    end

    return longest if longest != nil
  end
end

# p sluggish_octopus(a)

def dominant_octopus(arr)
  quick_sort(arr).last
end

def quick_sort(arr)
  return arr if arr.length <= 1

  pivot = arr.first
  left = arr[1..-1].select { |el| el.length < pivot.length }
  right = arr[1..-1].select { |el| el.length >= pivot.length }

  quick_sort(left) + [pivot] + quick_sort(right)
end

# p dominant_octopus(a)

def clever_octopus(arr)
  longest = nil

  arr.each do |fish|
    longest = fish if longest.nil? || fish.length > longest.length
  end

  longest
end

# p clever_octopus(a)

def slow_dance(direction, array)
  array.each_with_index do |move, idx|
    return idx if move == direction
  end

  nil
end

# p slow_dance("down", tiles_array)

def constant_dance(direction, hash)
  hash[direction]
end

# p constant_dance("down", new_tiles_data_structure)
