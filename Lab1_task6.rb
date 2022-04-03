# задание 6

str = "овалу 010 февраля 2012 13 марта 2013ап гкец ыдуы 18 сентября 20932"
puts str.scan(/([0-2][0-9]|3[0-1]).(0[1-9]|1[0-2]|января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря).([0-9]{4})/).map{|e| e.join(' ')}.join(" ")

# задание 6.1

def max_float(str)
  return str.scan(/\-\d+\.\d+|\d+\.\d+/).map{ |n| n.to_f }.max
end

# задание 6.9

def min_rat(str)
  return str.scan(/[-+]?\d+\/\d+|[-+]?\d+\.\d+/).map{|e| e.to_f}.min
end

# задание 6.18

def max_count_dig(str)
  return str.scan(/\d+/).map{ |i| i.size }.max
end

choice = ARGV[0]

case choice
when "1"
  str = "34.0321, 189.4, 4.231 -1.23"
  puts max_float(str)
when "2"
  str = "2/5 56.8 3/5 21.0 -10.9"
  puts min_rat(str)
when "3"
  str="1234.p1 1234567g4"
  puts max_count_dig(str)
end