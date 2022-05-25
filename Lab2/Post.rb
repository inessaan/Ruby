class Post
  attr_accessor :department, :post_name, :salary, :vacancy

  def initialize(department, post_name, salary, vacancy)
    self.department= department
    self.post_name= post_name
    self.salary= salary
    self.vacancy= vacancy
  end

  # Получение информации
  def to_s()
    post_str = "#{@post_name}|#{@salary}|#{@vacancy}|#{@department}"
  end

  # Получение строки должности
  def Post.get_post_str(post)
    post_name,salary,vacancy,department=post.split(" ")
    Post.new(department,post_name,salary,vacancy)
  end
end
