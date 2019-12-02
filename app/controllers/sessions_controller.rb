class SessionsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/orders'
        else
            flash[:errors] = "Incorrect Login Information"
            redirect_to "/"
        end
    end
end
