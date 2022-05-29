require_relative '../model/model'
require 'sinatra'
require 'yaml/store'


class Controller

  def initialize
    @employee = Model.new
  end

  def get_list(file_name)
    @employee = YAML::Store.new(file_name)
  end

  def find(id)
    @employee.transaction do
      @employee[id]
    end
  end


  def all
    @employee.transaction do
      @employee.roots.map { |id| @employee[id] }
    end
  end


  def save(data)
    @employee.transaction do
      unless data.id
        highest_id = @employee.roots.max || 0
        data.id = highest_id + 1
      end
      @employee[data.id] = data
    end
  end


  def change(data)
    @employee.transaction do
      @employee[data.id] = data
    end
  end


  def delete(data)
    @employee.transaction do
      @employee.delete(data.id)
    end
  end

  def delete_for_form
    rooms = Model.new
    rooms.id = params['id'].to_i
    @employee.delete(rooms)
  end

end


