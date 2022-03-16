# задание 1

str = "рвуцкнQEdAdfg_русскаяА"
puts str.count "А-я"

# задание 2

str = "АабаА"
str_palin = str.scan /А-я/
puts str_palin == str_palin.reverse

# задание 18

str = "овалу 10.02.2002 авц10.03.2004 10.1.2005"
puts str.scan(/([0-2][0-9]|3[0-1]).(0[1-9]|1[0-2]).([0-9]{4})/).map{|e| e.join('.')}.join(" ")