class UsersController < ApplicationController
  before_action :authenticate_user,{only: [:edit, :update]}
  before_action :forbid_login_user,{only: [:new, :create, :login_form, :login]}
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name],
                      password: params[:password],
                      age: params[:age],
                      height: params[:height],
                      weight: params[:weight])
    if @user.save
      flash[:notice] = "新規ユーザの登録に成功しました"
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      render('users/new')
    end
  end

  def show 
    @user = User.find_by(id: params[:id])
    @records = Post.where(is_record: true, user_id: @user.id)
    @targets = Post.where(is_record: false, user_id: @user.id)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.password = params[:password]
    @user.age = params[:age]
    @user.height = params[:height]
    @user.weight = params[:weight]
    if @user.save
      flash[:notice] = "ユーザ情報を修正しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/#{@user.id}/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(name: params[:name],
                          password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "名前またはパスワードが間違っています"
      @name = params[:name]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

end
