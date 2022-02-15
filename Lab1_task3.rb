arr = [1, 2, 3, 4, 5]

def sum_elem(x)
  res = 0
  x.each do |i|
    res += i
    end
  res
end

puts sum_elem(arr)

def mult_elem(x)
  res = 1
  x.each do |i|
    res *= i
    end
  res
end

puts mult_elem(arr)

def min_elem(x)
  res = x[0]
  x.each do |i|
    if res > i
      res = i
    end
    end
  res
end

puts min_elem(arr)

def max_elem(x)
  res = x[0]
  for i in x do
    if res < i
      res = i
    end
  end
  res
end

puts max_elem(arr)