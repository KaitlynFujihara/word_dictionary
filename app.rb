require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload('lib/**/*.rb')
require './lib/word_dictionary'

get('/') do
  @words = Word.all()
  erb(:input)
end

post('/') do
  word = params["word"]
  definition = params["definition"]
  new_word = Word.new({:word=>word, :definition=>definition})
  new_word.save()
  @words = Word.all()
  erb(:input)
end

post('/output/:id') do
  word = params["word"]
  definition = params["definition"]
  new_word = Word.new({:word=>word, :definition=>definition})
  new_word.save()
  @words = Word.all()
  erb(:output)
end

get('/output/:id') do
  newdef = params["newdef"]
  new_definition = Word.new({:newdef=>newdef})
  new_definition.save()
  @words = Word.all()
  erb(:output)
end

post ('/output/id') do
  newdef = params["newdef"]
  new_definition = Word.new({:newdef=>newdef})
  new_definition.save()
  @words = Word.all()
  erb(:output)
end

get('/output/<%= word.id %>') do
    @words = Word.find(params[:id])
    erb(:output)
end
