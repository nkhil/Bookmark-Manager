require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    "Bookmark Manager"
  end
end