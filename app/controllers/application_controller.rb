
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end



  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params[:post])
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
    # binding.pry
    post = Post.find(params[:id])
    Post.update(params[:id], params[:post])
    redirect "/posts/#{post.id}"
  end

  delete "/posts/:id" do
    Post.find(params[:id]).destroy
    redirect "/posts"
  end

 


end
