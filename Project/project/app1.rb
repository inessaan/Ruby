require 'sinatra'

require_relative "Model/model"
require_relative 'Controllers/controller'

require 'yaml/store'


data = Controller.new
data.get_list('rooms.yml')

get('/project') do
  @rooms = data.all
	erb :index
end


get('/project/new') do
	erb :new
end


post('/project/create') do
	@rooms = Model.new
	@rooms.name = params['name']
	@rooms.type = params['type']
	@rooms.cost = params['cost']
	data.save(@rooms)
	redirect '/project/new'
end


get('/project/delete') do
	erb :delete
end

post('/project/delete_highlight') do
	@rooms = Model.new
	@rooms.id = params['id'].to_i
	data.delete(@rooms)
	redirect '/project/delete'
end


get('/project/update') do
	erb :update
end

post('/project/updates') do
	@rooms = Model.new
	@rooms.name = params['name']
	@rooms.type = params['type']
	@rooms.cost = params['cost']
	@rooms.id = params['id'].to_i
	data.change(@rooms)
	redirect '/project/update'
end

get("project/:id") do
	id = params['id'].to_i
	@rooms = redirect.find(id)
	erb :show
end