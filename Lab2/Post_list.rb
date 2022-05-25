class Post_list
  attr_reader :post_list

  def initialize(arr=Array.new())
    @post_list=arr
    @selected_note=0
  end


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

  def get_note()
    @post_list[@selected_note]
  end


  def delete_note()
    @post_list.delete_at(@selected_note)
    @selected_note=0
  end


  def get_vacancies()
    @post_list.select{|post| post.vacancy}
  end


  def sort_by_name()
    @post_list.sort_by!{|post| post.post_name.downcase}
  end

  def to_s()
    str=""
    @post_list.each do |post|
      str+=post.to_s() +"\n"+"-\n"
    end
    str
  end
end
