require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
