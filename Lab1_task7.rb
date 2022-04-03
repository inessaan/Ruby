file_name = ARGV[0]      #ruby lab1_task7.rb input.txt

f = File.new(file_name, 'r:UTF-8')
str = f.readlines
f.close

puts str.sort_by{ |i| i.size }
puts "*************"
puts str.sort_by{ |i| i.split().size }

puts "*************"

def vowel_consonant (str)
  return str.sort_by{|n| ((n.scan(/[аеёиоуэыюяАЕЁИОУЭЫЮЯ]/)).size - (n.scan(/[бвгджзйклмнпрстфхцчшщБВГДЖЗЙКЛМНПРСТФХЦЧШЩ]/)).size)}
end


choice = ARGV[1]

case choice
when "1"
  puts vowel_consonant(str)
end