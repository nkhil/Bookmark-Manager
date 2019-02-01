require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative './lib/bookmark'
require_relative './database_connection_setup'


class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    # p @bookmarks
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks-process' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      p "form data submitted to /bookmarks"
      Bookmark.create(url: params[:url], title: params[:title])
      redirect '/bookmarks'
    else
      flash[:notice] = "Please submit a valid url you beauty"
      redirect 'bookmarks/new'
    end
  end

  delete '/bookmarks/:id' do
    p params
    Bookmark.delete(id: params[:id])
    redirect ('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    p "/bookmarks/:id/edit params..."
    p params
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    p "bookmarks/:id params..."
    p params
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect ('/bookmarks')
  end



  run! if app_file == $0
end
