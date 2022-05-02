current_path = File.dirname(__FILE__)
require "#{current_path}/Department.rb"

dep_rek = Department.new('Recruitment Department', '89294723412', ['aaa','bbb'])

dep_it = Department.new('IT Department', '89265499854')


puts dep_rek
puts dep_rek.show_duties


dep_rek.add_duty('qqq')
puts dep_rek

dep_rek.delete_duty('qqq')
puts dep_rek

dep_rek.select_duty(1)
puts dep_rek.show_selected_duty

puts dep_rek.replace_selected_duty('ccc')

puts dep_rek.show_duties