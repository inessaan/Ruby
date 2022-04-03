# задание 6

str = "овалу 010 февраля 2012 13 марта 2013ап гкец ыдуы 18 сентября 20932"
puts str.scan(/([0-2][0-9]|3[0-1]).(0[1-9]|1[0-2]|января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря).([0-9]{4})/).map{|e| e.join(' ')}.join(" ")

# задание 6.1

puts "Введите строку:"
str= STDIN.gets.chomp
puts  str.scan(/\-\d+\.\d+|\d+\.\d+/).map{ |n| n.to_f }.max

# задание 6.9
puts "Введите строку:"
str= STDIN.gets.chomp
puts str.scan(/[-+]?\d+\/\d+|[-+]?\d+\.\d+/).map{|e| e.to_f}.min

# задание 6.18

puts "Введите строку:"
str= STDIN.gets.chomp
puts  str.scan(/\d+/).map{ |i| i.size }.max