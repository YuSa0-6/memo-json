require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
require_relative 'models/memo'

get '/' do
  redirect '/memos'
end

get '/memos' do
  @memos = Memo.new.all
  @page_title = 'Top page'
  erb :top
end