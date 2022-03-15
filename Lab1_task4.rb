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


# print(count_after_max(get_list()))

# Задание 13


def before_min(arr)
  return arr.push(arr.slice!(0...arr.index(arr.min)))
end

# Задание 25


def max_in_interval(arr, a, b)
  return arr[a...b].max
end

# Задание 37

def indxs(arr)
  arr_min = (1...arr.size).select{ |x| arr[x] < arr[x-1] }
  indexes = "Индексы элементов, меньших левого соседа: #{arr_min}.
Их количество: #{arr_min.size}"
  return indexes
end

# Задание 49

require 'prime'

def del(a)
  b = (1..a/2+1)
  lis = []
  b.each{ |i| if a%i==0 then lis.append(i) end }
  return lis
end


def all_prime_del(arr)
  arr_new = (1...arr.size).select{ |x| arr[x] < arr[x-1] }
  arr.each{ |i| arr_new.append(del(i)) }
  arr_del = arr_new.flatten.uniq.sort
  prime_del = arr_del.select{ |i| Prime.prime?(i) }

  return prime_del
end

# Выбор задания

puts "Выберите задание:
1. - Задание 1
2. - Задание 13
3. - Задание 25
4. - Задание 37
5. - Задание 49"

task = gets.chomp
case task
when '1'
  puts count_after_max(get_list())
when '2'
  puts before_min(get_list())
when '3'
  print "Введите (a, b) через пробел: "
  a, b = gets.chomp.split.map(&:to_i)
  puts max_in_interval(get_list(), a, b)
when '4'
  puts indxs(get_list())
when '5'
  print all_prime_del(get_list())
end

