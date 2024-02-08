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

get '/memos/:id' do
  memos = Memo.new.all
  @memo_title = memos[params[:id].to_s]['title']
  @memo_content = memos[params[:id].to_s]['content']
  @page_title = 'Show page'
  erb :show
end