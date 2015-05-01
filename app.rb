require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/definitions') do
  @definitions = Definition.all()
  erb(:definitions)
end

get('/definitions/new') do
  erb(:definitions_form)
end

post('/definitions') do
  definition = params.fetch("definition")
  new_definition = Definition.new(definition)
  new_definition.save()
  erb(:success)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch("id").to_i())
  erb(:definition)
end
