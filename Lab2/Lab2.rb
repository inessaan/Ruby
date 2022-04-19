class Department
  @duties = []

  def initialize (name, phone, duties = nil)
    @name = name
    self.phone = phone
    @duties = duties
  end


  attr_accessor :name, :phone, :selected_duty


  def add_duty(duty)
    @duties.push(duty)
  end


  def delete_duty(duty)
    @duties.delete_at(@duties.index(duty))
  end


  def show_duties
    if @duties.empty?
      "No duties were found in this department."
    else
      "Duties in this department: #{@duties.join(", ")}"
    end
  end


  def select_duty(index)
    @selected_duty = index
  end


  def show_selected_duty
    if @selected_duty.nil?
      "Duty not selected"
    else
      "Selected duty: #{@duties[@selected_duty]}"
    end
  end

  def replace_selected_duty(text)
    @duties[@selected_duty] = text
    "The selected duty has been renamed to #{ @duties[@selected_duty]}"
  end

  def to_s
    unless @duties.empty?
      duty = @duties.join(', ')
      return "Department name: #{@name}\nContact phone: #{@phone}\nDuties: #{duty}\n\n"
    end
    "Department name: #{@name}\nContact phone: #{@phone}\n"
  end

end

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