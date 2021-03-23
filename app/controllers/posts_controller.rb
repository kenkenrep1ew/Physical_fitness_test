class PostsController < ApplicationController
  def index
    @records = Post.where(is_record: true)
    @targets = Post.where(is_record: false)
  end

  def new
    @post = Post.new
  end

  def create
    run = params[:run_min] + "-" + params[:run_sec]
    @post = Post.new(date: "2021-03-21".to_date,
                     push_up: params[:push_up],
                     sit_up: params[:sit_up],
                     run: run,
                     is_record: params[:is_record])
    if @post.save
      msg = ""
      if params[:is_record] == 1
        msg = "記録"
      else
        msg = "目標"
      end
      flash[:notice] = msg + "の登録に成功しました"
      redirect_to('/posts/index')
    else
      redirect_to('/posts/new')
    end
  end

  def show 
    @id = params[:id]
    @post = Post.find_by(id: @id)
  end

  def edit
  end

end
