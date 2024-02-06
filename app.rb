require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  redirect '/memos'
end

get '/memos' do
  @page_title = 'Top page'
  erb :top
end