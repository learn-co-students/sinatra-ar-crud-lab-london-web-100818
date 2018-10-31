
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
    @blogs = Post.all
    erb :posts
  end

  post '/posts' do
    @blog = Post.create(params)
    erb :show
  end

  get '/posts/:id' do
    @blog = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @blog = Post.find(params[:id])
    erb :edit
  end 

  patch '/posts/:id' do
    @blog = Post.find(params[:id])
    @blog.update(params.select {|k,v| ["name", "content"].include?(k)})
    redirect "posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    @blog = Post.destroy(params[:id])
    redirect "posts/show"
  end

end
