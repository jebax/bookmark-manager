require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/list' do
    redirect("/bookmarks")
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :add
  end

  post '/bookmarks/new' do
    Bookmark.create(params[:title], params[:url])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
