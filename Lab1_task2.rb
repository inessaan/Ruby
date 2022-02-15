# Задание 2

#1
def dig_sum(x)
  res = 0
  while x > 0
    res += x % 10
    x /= 10
  end
  res
  puts res
end

numb = ARGV[0].to_i
dig_sum(numb)

#2
def dig_mult(x)
  res = 1
  while x>0
    res*= x%10
    x /= 10
  end
  res
end

puts dig_mult(numb)

def dig_max(x)
  res = 0
  while x > 0
    if res < x % 10
      res = x % 10
    end
    x /= 10
  end
  res
end

puts dig_max(numb)

def dig_min(x)
  res = 10
  while x > 0
    if res > x % 10
      res = x % 10
    end
    x /= 10
  end
  res
end

puts dig_min(numb)