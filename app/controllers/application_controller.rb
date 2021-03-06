class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user
        if @current_user == nil
            flash[:notice] = "ログインが必要です"
            redirect_to("/login")
        end
    end

    def forbid_login_user
        if @current_user
            flash[:notice] = "ログイン済みです"
            redirect_to("/users/#{@current_user.id}")
        end
    end

    def only_admin_user
        if @current_user.id != 1
            flash[:notice] = "権限がありません"
            redirect_to("/users/#{@current_user.id}")
        end
    end           
end
