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

get '/memos/new' do
  @page_title = 'New page'
  erb :new
end

get '/memos/:id/edit' do
  memos = Memo.new.all
  @title = memos[params[:id].to_s]['title']
  @content = memos[params[:id].to_s]['content']
  erb :edit
end

get '/memos/:id' do
  memos = Memo.new.all
  @memo_title = memos[params[:id].to_s]['title']
  @memo_content = memos[params[:id].to_s]['content']
  @page_title = 'Show page'
  erb :show
end

post '/memos' do
  title = params[:title]
  content = params[:content]

  memos = Memo.new.all
  id = (memos.keys.map(&:to_i).max + 1).to_s
  memos[id] = { 'title' => title, 'content' => content }
  Memo.new.create(memos)

  redirect '/memos'
end

patch '/memos/:id' do
  @page_title = 'Edit page'
  erb :edit
end
