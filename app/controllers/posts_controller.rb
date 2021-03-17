class PostsController < ApplicationController
  def index
    @post = "TEST POST"
  end

  def new
  
  end

  def create
    redirect_to('/posts/index')
  end

end
