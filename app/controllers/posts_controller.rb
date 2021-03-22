class PostsController < ApplicationController
  def index
    @records = Post.where(is_record: true)
    @targets = Post.where(is_record: false)
  end

  def new
  
  end

  def create
    run = params[:run_min] + "-" + params[:run_sec]
    @post = Post.new(date: "2021-03-21".to_date,
                     push_up: params[:push_up],
                     sit_up: params[:sit_up],
                     run: run,
                     is_record: params[:is_record])
    @post.save
    redirect_to('/posts/index')
  end

end
