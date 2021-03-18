class PostsController < ApplicationController
  def index
    @record = Post.find_by(id:1)
    @target = Post.find_by(id:2)
  end

  def new
  
  end

  def create
    redirect_to('/posts/index')
  end

end
