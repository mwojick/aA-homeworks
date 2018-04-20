def sum_to(n)
	return nil if n < 0
	return 0 if n == 0
	n + sum_to(n-1)
end


def add_numbers(nums_array)
	return nil if nums_array == []
	return nums_array.first if nums_array.length == 1
	nums_array.last + add_numbers(nums_array[0...-1])
end

def gamma_fnc(num)
	fac(num-1)
end

def fac(num)
	return nil if num <= -1
	return 1 if num == 0
	num*fac(num-1)
end


def ice_cream_shop(flavors, favorite)

	return true if flavors.pop == favorite
	return false if flavors.length == 0

	ice_cream_shop(flavors, favorite)

end

def reverse(string)
	return string if string.length == 0
	string[-1] + reverse(string[0...-1])
end



if __FILE__ == $0

 # p  reverse("house") # => "esuoh"
 # p  reverse("dog") # => "god"
 # p  reverse("atom") # => "mota"
 # p  reverse("q") # => "q"
 #  p reverse("id") # => "di"
 #  p reverse("") # => ""

end
