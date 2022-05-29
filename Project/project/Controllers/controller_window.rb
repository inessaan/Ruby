require_relative '../model/model'
require 'sinatra'
require 'yaml/store'
require_relative 'controller'

class Controller_Window < Sinatra::Base

  employee = Controller.new
  employee.get_list('../rooms.yml')

  def initialize
  end
  get('/project/controllers') do
    @rooms = employee.all
    erb :index
  end


  get('/project/controllers/new') do
    erb :new
  end


  get('/project/controllers/delete') do
    erb :delete
  end

  post('/project/controllers/delete_highlight') do
    @movie = Model.new
    @movie.id = params['id'].to_i
    employee.delete(@movie)
    redirect '/project/delete'
  end



  post('/project/controllers/create') do
    @movie = Model.new
    @movie.name = params['name']
    @movie.type = params['type']
    @movie.cost = params['cost']
    employee.save(@movie)
    redirect '/project/controllers/new'
  end


  get('/project/controllers/update') do
    erb :update
  end

  post('/project/controllers/updates') do
    @movie = Model.new
    @movie.name = params['name']
    @movie.type = params['type']
    @movie.cost = params['cost']
    @movie.id = params['id'].to_i
    employee.change(@movie)
    redirect '/project/controllers/update'
  end



  get('/project/controllers/:id') do
    id = params['id'].to_i
    @rooms = employee.find(id)
    erb :show
  end
end

