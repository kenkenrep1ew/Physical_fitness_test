class PostsController < ApplicationController
  def index
    @records = Post.where(is_record: true)
    @targets = Post.where(is_record: false)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(date: params[:date],
                     push_up: params[:push_up],
                     sit_up: params[:sit_up],
                     run_min: params[:run_min],
                     run_sec: params[:run_sec],
                     is_record: params[:is_record])
    if @post.save
      msg = record_or_target(@post.is_record)
      flash[:notice] = msg + "の登録に成功しました"
      redirect_to('/posts/index')
    else
      render('posts/new')
    end
  end

  def show 
    @id = params[:id]
    @post = Post.find_by(id: @id)
    @msg = record_or_target(@post.is_record)
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @msg = record_or_target(@post.is_record)

  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.push_up = params[:push_up]
    @post.sit_up = params[:sit_up]
    @post.run_min = params[:run_min]
    @post.run_sec = params[:run_sec]
    if @post.save
      msg = record_or_target(@post.is_record)
      flash[:notice] = msg + "の修正に成功しました"
      redirect_to('/posts/index')
    else
      render("posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to('/posts/index')
  end

  def record_or_target(is_record)
    if is_record.to_i == 1
      return "記録"
    else
      return "目標"
    end
  end

end
