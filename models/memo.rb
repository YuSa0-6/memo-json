require 'json'
require 'sinatra/reloader' if development?
FILE_PATH = 'public/data.json'

class Memo
  def all
    File.open(FILE_PATH) { |file| JSON.parse(file.read) }
  end
end