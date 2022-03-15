def input
  return gets.chomp.split().map(&:to_i)
end

def get_file(path)
  file = File.new(path, "r:UTF-8")
  arr = file.read
  return arr.split.map(&:to_i)
end

def get_list()
  puts "Введите способ получения массива"
  puts "1. - С клавиатуры"
  puts "2. - С файла"

  chose = gets.chomp

  if chose == "1"
    print "Введите элементы массива через пробел: "
    arr = input()
    return arr

  elsif chose == "2"
    print "Введите путь до файла: "   #D:\GitHub\Ruby\input.txt
    arr = get_file(gets.chomp)
    return arr
  end
end

# Задание 1

def count_after_max(arr)
  return arr.reverse.index(arr.max)
end


print(count_after_max(get_list()))