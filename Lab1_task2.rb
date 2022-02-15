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


