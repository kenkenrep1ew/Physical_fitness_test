class PostsController < ApplicationController
  before_action :authenticate_user,{only: [:index, :update]}
  def index
    @records = Post.where(is_record: true, user_id: @current_user.id)
    @targets = Post.where(is_record: false, user_id: @current_user.id)
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
                     is_record: params[:is_record],
                     user_id: @current_user.id)
    if @post.save
      msg = record_or_target(@post.is_record)
      flash[:notice] = msg + "の登録に成功しました"
      redirect_to("/users/#{@current_user.id}")
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
      flash[:notice] = msg + "を修正しました"
      redirect_to("/users/#{@current_user.id}")
    else
      render("posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/users/#{@current_user.id}")
  end

  def record_or_target(is_record)
    if is_record.to_i == 1
      return "記録"
    else
      return "目標"
    end
  end

end
