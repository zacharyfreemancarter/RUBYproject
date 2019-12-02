class UsersController < ApplicationController
    def root
    end
    def new
    end
    def create
        @user =User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to "/orders"
        else
            flash[:errors] = @user.errors.messages
            redirect_to '/users/new'
        end
    end
    private
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
