require_relative 'Department.rb'
class Department_list

  def initialize(arr=Array.new())
    @dep_list=arr
    @selected_note=0
  end

  # Добавления записи
  def add_note(department)
    @dep_list.append(department)
  end

  # Выделяем запись
  def choose_note(index)
    @selected_note=index
  end

  # Заменяет запись
  def change_note(department)
    @dep_list[@selected_note]=department
  end

  # Возвращает запись
  def get_note()
    @dep_list[@selected_note]
  end

  # Удалет запись
  def delete_note()
    @dep_list.delete_at(@selected_note)
    @selected_note=0
  end

  # Считать список
  def Department_list.read_from_txt(path)
    file = File.new(path, "r:UTF-8")
    text = file.read
    arr = text.split((/\n_+\n/)).map do|dep|
      Department.get_dep_str(dep)
    end
    Department_list.new(arr)
  end

  # Запись в txt
  def write_to_txt(path)
    File.open("#{path}", "w") do |file|
      @dep_list.each do |e|
        file.puts e
        file.puts "_"
      end
    end
  end

  # Запись в yaml
  def write_to_yaml(path)
    File.open(path, "w") do |file|
      file.write(YAML.dump(@dep_list))
    end
  end

  # Читалка списка отдела через txt
  def Department_list.read_from_yaml(path)
    Department_list.new(Psych.safe_load_file(path, permitted_classes: [Department,Post_list,Post]))
  end

  # Сортировка списка отдела по имени
  def sort_by_name()
    @dep_list.sort_by!{|dep| dep.name.downcase}
  end

  # Сортировка по по количеству вакантных должностей
  def sort_by_numbers_vacancies
    @dep_list.sort_by{|dep| dep.get_number_vacancies}
  end

  # Получение информации
  def to_s()
    str=""
    @dep_list.each do |dep|
      str+=dep.to_s() +"\n"+"_\n"
    end
    str
  end

  # Получение информации,но в урезанной форме
  def to_s_short()
    str=""
    @dep_list.each do |dep|
      str+=dep.to_s_short() +"\n"+"_\n"
    end
    str
  end
end