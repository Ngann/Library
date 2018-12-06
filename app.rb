
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/author')
require('./lib/book')
require('./lib/checkout')
require('./lib/patron')
require('pry')

get('/') do
  erb(:index)
end

get('/catalogue') do
  erb(:catalogue)
end

get('/checkout') do
  erb(:checkout)
end

get('/internal') do
  erb(:internal)
end

get('/add_books') do
  @books = Book.all
  erb(:internal)
end

post('/add_books') do
  title = params.fetch('title')
  author = params.fetch('author')
  status = params.fetch('status')
  book = Book.new({:title => title, :author => author, :status => status, :id => nil})
  book.save
  @books = Book.all
  erb(:catalogue)
end
#
# get('/list/:id') do
#   @list_id = params[:id].to_i
#   list = List.find(@list_id)
#   @name = list.name
#   @tasks = Task.all
#   erb(:list)
# end
#
# post('/add_item/:id') do
#   @list_id = params[:id].to_i
#   list = List.find(@list_id)
#   @name = list.name
#   @task_name = params.fetch('name')
#   @description = params.fetch('description')
#   @due_date = params.fetch('due_date')
#   task = Task.new({:name => @task_name, :description =>  @description, :due_date => @due_date, :id => nil, :list_id => @list_id})
#   task.save
#   @tasks = Task.all
#   erb(:list)
# end
