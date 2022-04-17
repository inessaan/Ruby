class Department
  def initialize (name, phone)
    @name = name
    @phone = phone
  end

  attr_accessor :name, :phone
end

dep_rek = Department.new('Отдел подбора персонала', '89294723412')

dep_it = Department.new('IT-отдел', '89265499854')

puts "Подразделение: #{dep_rek.name}, контактный номер: #{dep_rek.phone}"
puts "Подразделение: #{dep_it.name}, контактный номер: #{dep_it.phone}"