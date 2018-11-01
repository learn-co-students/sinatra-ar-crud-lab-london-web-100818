
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  
  post '/posts' do
    Post.create(params)
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id/edit' do
    @post_id = params[:id]
    @post = Post.find(@post_id)
    erb :edit
  end

  get '/posts/:id' do
    post_id = params[:id]
    @post = Post.find(post_id)
    erb :show
  end


  patch '/posts/:id' do
    @post_id = params[:id]
    post_to_update = Post.find(@post_id)
    post_to_update.update(name: params[:name], content: params[:content])
    @post = Post.find(@post_id)
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.destroy(@post.id)
    erb :delete
  end


end
