path = File.dirname(__FILE__) #путь к папке
require "#{path}/Department.rb"
require "#{path}/Department_list.rb"

require "yaml"

# Считывание отделов из файла txt
def read_from_txt(path)
  arr = Array.new
  file = File.new(path, "r:UTF-8")
  text = file.read
  arr = text.split((/\n_+\n/)).map do|dep|
    Department.get_dep_str(dep)
  end
  arr
end

# Запись отделов в файл
def write_to_txt(path, arr)
  File.open("#{path}", "w") do |file|
    arr.each do |e|
      file.puts e
      file.puts "_"
    end
  end
end

# Вывод отделов из файла
def print_dep(arr)
  arr.each do |dep|
    puts dep
    puts "_"
  end
end

# Читаем ямл
def read_from_yaml(path)
  Psych.safe_load_file(path, permitted_classes: [Department])
end

# Записываем ямл
def write_to_yaml(path, arr)
  File.open(path, "w") do |file|
    file.write(YAML.dump(arr))
  end
end



def main

  #arr_dep=read_from_txt("Departments.txt")
  #arr_dep=read_from_yaml("departments.yaml")

  #deps_list=Department_list.read_from_yaml("Departments.yaml")

  #write_to_yaml("Departments.yaml",arr_dep)
  #deps_list=Department_list.read_from_yaml("Departments.yaml")
  #puts deps_list
  #deps_list.add_note(Department.new("Отдел_Закупок","+89284355055"))
  #deps_list.sort_by_name
  #puts deps_list

  #dep=Department.new("Рекламный_отдел","+74234252230","Пиарить")

  #dep.add_post("Гл_пиарщик","12","true")

  deps_list=Department_list.read_from_yaml("Departments+Post.yaml")
  #deps_list.add_note(dep)

  #deps_list.choose_note(7)
  #deps_list.delete_note()

  puts deps_list.sort_by_numbers_vacancies

  #puts deps_list.get_note.get_number_vacancies
  #puts deps_list.to_s_short
  deps_list.write_to_yaml("Departments+Post.yaml")
end

if __FILE__ == $0
  main
end

