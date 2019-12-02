class CourrierController < ApplicationController
    def index
        @progress = Progress.all
        @user = User.find(session[:user_id])
        myorders = @user.deliveries
        @myorders = myorders.where("step < ?", 5)
        @orders = Order.where(step: nil, paid: true)
    end
    def claim
        @order = Order.find(params[:id])
        if @order.delivered_by.empty?
            @order.step = 1 
            @order.save
            @courier = Courier.new
            @courier.user_id = User.find(session[:user_id]).id
            @courier.order_id = @order.id
            @courier.save
            redirect_to '/courier/index'
        else
            redirect_to '/courier/index'
        end
    end
    def order
    end
    def update
        @order = Order.find(params[:id])
        @order.step += 1
        @order.save
        redirect_to '/courier/index'
    end
    def login
        @user = User.find(session[:user_id])
        @user.is_online = true
        @user.save
        redirect_to '/courier/index'
    end
    def logoff
        @user = User.find(session[:user_id])
        @user.is_online = false
        @user.save
        redirect_to '/courier/index'
    end
end
