require_relative 'Post_list.rb'
require_relative 'Post.rb'

class Department
  @duties = []

  def initialize (name,phone_number,duties=nil,selected_duty=nil,post_list=Post_list.new)
    self.name= name
    self.phone= phone
    @duties = duties
    @selected_duty = selected_duty
    @post_list = post_list
  end


  def phone=(phone)
    if not Department.is_phone?(phone)
      raise "Некорректный номер телефона"
    end
    phone.gsub!(/^8/, "7")
    @phone = phone.delete("- )(+")
  end

  def self.is_phone?(phone)
    return phone.scan(/^(\s*)?(\+?7|8)([(\- ]?\d{3}[)\- ]?)(\d{3}[\- ]?\d{2}[\- ]?\d{2}|\d{2}[\- ]?\d{3}[\- ]?\d{2})(\s*)?$/).length == 1
  end

  def name
    @name
  end

  def name=(name)
    @name=name
  end


  attr_accessor :name
  attr_reader :phone

  #вывод всех обязанностей
  def Department.get_dep_str(dep)
    dep = dep.split("\n")
    dep_name,phone_number=dep[0].split("|")
    duties=Hash.new
    dep[1..dep.size].each do|duty|
      duty,spec = duty.split(":")
      duties[duty]=spec
    end
    Department.new(dep_name,phone_number,duties)
  end

  # Добавить обязанность
  def add_duty(duty,specification)
    @duties[duty] = specification
  end

  # Выделить обязанность
  def select_duty(duty)
    if @duties.has_key?(duty)
      @select_duty = duty
    else
      raise "Нет обязанности"
    end
  end

  # Удалить обязанность
  def delete_duty()
    @duties.delete(@select_duty)
    @select_duty = @duties.keys[0]
  end

  # Получить текст обязанности
  def get_specification()
    @duties[@select_duty]
  end

  # Заменить текст выделенной обязанности
  def change_specification(specification)
    @duties[@select_duty] = specification
  end

  # Получить обязанности
  def get_duties()
    @duties.keys.join(" | ")
  end


  # Добавить должность
  def add_post(post_name,salary,vacancy)
    @post_list.add_note(Post.new(@name,post_name,salary,vacancy))
  end

  # Выбрать должность
  def select_post(index)
    @post_list.choose_note(index)
  end

  # Возвращает выбраную должность
  def get_selected_post()
    @post_list.get_note
  end

  # Удалить должность
  def delete_post()
    @post_list.delete_note
  end

  # Получить все должности
  def get_all_posts()
    @post_list.post_list
  end

  def to_s
    department_str="#{@name}|#{@phone_number}"
    @duties.keys.each{|duty| department_str+="\n#{duty}:#{@duties[duty]}"}
    department_str+= @post_list.to_s
    department_str
  end

  def to_s_short()
    department_str="#{@name}|#{@phone}"
  end

end