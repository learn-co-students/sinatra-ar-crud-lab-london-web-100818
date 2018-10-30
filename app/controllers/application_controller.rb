
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts/new' do
    Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :posts
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :view_post
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit_post
  end

  patch '/posts/:id/edit' do
    post = Post.find(params[:id])
    post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{post.id}"
  end

  delete '/posts/:id/delete' do
    post = Post.find(params[:id])
    post.destroy
    redirect "/posts"
  end
end
