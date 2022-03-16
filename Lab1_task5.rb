# задание 1

str = "рвуцкнQEdAdfg_русскаяА"
puts str.count "А-я"

# задание 2

str = "АабаА"
str_palin = str.scan /А-я/
puts str_palin == str_palin.reverse