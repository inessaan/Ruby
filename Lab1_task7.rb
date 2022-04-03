file_name = ARGV[0]      #ruby lab1_task7.rb input.txt

file = File.new(file_name, 'r:UTF-8')
lines = file.readlines
file.close

puts lines.sort_by{ |i| i.size }
puts "*************"
puts lines.sort_by{ |i| i.split().size }

