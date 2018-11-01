
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
      @post = Post.find(params[:id])
      erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    new_hash = {}
    new_hash[:name] = params[:name]
    new_hash[:content] = params[:content]
    post.update(new_hash)
    redirect "/posts/#{post.id}"
  end

  delete '/posts/:id' do
    delete_post = Post.find(params[:id])
    delete_post.destroy
    redirect '/posts'
  end


end
