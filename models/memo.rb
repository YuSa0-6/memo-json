require 'json'
require 'sinatra/reloader' if development?
FILE_PATH = 'public/data.json'

class Memo
  def all
    JSON.parse(File.read(FILE_PATH))
  end
end