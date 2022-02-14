#Задание 1

#1.1
print "Hello, World!"
puts "Hello, World!" #то же самое, но в конце есть символ переноса строки \n

#1.2

 "Введите свое имя: "
input_name = ARGV[0]
puts "Привет, #{input_name}"

#1.3
input = gets
name = input.chomp

puts "#{name}, какой твой любимый язык?"

lang = gets.downcase.chomp
if lang == "ruby"
  puts "бе, подлиза"
else
  puts "скоро будет ruby"
end

#1.3 case
case lang
when "ruby"
  puts "бе, подлиза"
when "python"
  puts "а вот это мне нравится больше"
when "html"
  puts "чел, ты...."
when "c++"
  puts "ох, первый курс..."
else
  "ты ж программист"
end


