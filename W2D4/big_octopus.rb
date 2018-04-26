require_relative 'sorting_demo'

def find_fish_n_time(array)
	longest = 0
	longest_el = ""

	array.each do |el|
		if longest < el.length
			longest = el.length
			longest_el = el
		end
	end
	longest_el
end


def slow_dance(target,array)
	array.each_with_index do |el,idx|
		if el == target
			return idx
		end
	end
	nil
end

def fast_dance(target,given_hash)
	if given_hash.key?(target)
		return given_hash[target]
	end
	nil
end


 if __FILE__ == $0

# Big O-ctopus and Biggest Fish

fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

new_tiles_data_structure = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

# O(n^2)
p SortingDemo.bubble_sort(fish_arr){|x,y| x.length <=> y.length }.last
# O(nlog(n))
p SortingDemo.merge_sort(fish_arr){|x,y| x.length <=> y.length }.last
# O(n)
p find_fish_n_time(fish_arr)


# Dancing Octopus

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

# Use a hash
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)

 end