class Post_list
  attr_reader :post_list

  def initialize(arr=Array.new())
    @post_list=arr
    @selected_note=0
  end

  # Добавить запись
  def add_note(post)
    @post_list.append(post)
  end

  # highlight
  def choose_note(index)
    @selected_note=index
  end

  # замена записи
  def change_note(post)
    @post_list[@selected_note]=post
  end

  # Получает запись
  def get_note()
    @post_list[@selected_note]
  end


  # удаляет запись
  def delete_note()
    @post_list.delete_at(@selected_note)
    @selected_note=0
  end

  # Получить вакансию
  def get_vacancies()
    @post_list.select{|post| post.vacancy}
  end

  # Сортировка списка вакансии по имени
  def sort_by_name()
    @post_list.sort_by!{|post| post.post_name.downcase}
  end

  # считать список должностей txt
  def Post_list.read_from_txt(path)
    file = File.new(path, "r:UTF-8")
    text = file.read
    arr = text.split((/\n_+\n/)).map do|post|
      Post.get_post_str(post)
    end
    Post_list.new(arr)
  end

  # Запись в txt
  def write_to_txt(path)
    File.open("#{path}", "w") do |file|
      @post_list.each do |e|
        file.puts e
        file.puts "_"
      end
    end
  end

  # Запись в yaml
  def write_to_yaml(path)
    File.open(path, "w") do |file|
      file.write(YAML.dump(@post_list))
    end
  end

  # считать список должностей через ямл
  def Post_list.read_from_yaml(path)
    Post_list.new(Psych.safe_load_file(path, permitted_classes: [Post]))
  end


  def to_s()
    str=""
    @post_list.each do |post|
      str+=post.to_s() +"\n"+"-\n"
    end
    str
  end

end
