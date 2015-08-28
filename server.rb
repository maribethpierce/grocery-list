require 'sinatra'
require 'shotgun'

get '/stuff' do
  @grocery = File.readlines('grocery_list.txt')
  erb :index
end

post '/groceries' do
  groceries = params['groceries']

  File.open('grocery_list.txt', 'a') do |file|
    file.puts(groceries)
  end

  redirect '/stuff'
end

get 'stuff/:item' do
  erb :show, locals: { item: params[:item]}
end
