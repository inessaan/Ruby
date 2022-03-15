# Задание 2

#1
def dig_sum(x)
  res = 0
  while x > 0
    res += x % 10
    x /= 10
  end

end

numb = ARGV[0].to_i
puts dig_sum(numb)

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

#3
meth = ARGV[1].to_i

def sum_div(x)   #13195 [5,7,13,29] = 54    654 [2,3,109]  =114
  res = 0
  d = 2
  while d * d <= x
    if x % d == 0
      res+=d
      x /= d
    else
      d += 1
    end
  end
  if x > 1
    res+=x
  end
  res
end

puts sum_div(numb)

def odd_3 (x)
  res = 0
  while x > 0
    d = x % 10
    if d % 2 != 0
      if d > 3
        res += 1
      end
    end
    x /= 10
  end
  res
end

puts odd_3(numb)

def mult_div(x)
  res = 1

  (1...x).each do |i|
    if x % i == 0
      if dig_sum(x) > dig_sum(x % i)
        res *= i
      end
    end
  end
  res
end

puts mult_div(numb)