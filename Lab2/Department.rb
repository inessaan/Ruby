class Department
  @duties = []

  def initialize (name, phone, duties = nil)
    @name = name
    @phone = phone
    @duties = duties
  end

  def name
    @name
  end

  def name=(name)
    @name=name
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
    unless @duties.nil?
      duty = @duties.join(', ')
      return "Department name: #{@name}\nContact phone: #{@phone}\nDuties: #{duty}\n\n"
    end
    "Department name: #{@name}\nContact phone: #{@phone}\n\n"
  end

end