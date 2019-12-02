class OrdersController < ApplicationController
    def index 
        data = File.read("#{Rails.root}/public/response.json")
        @data = JSON.parse(data).with_indifferent_access
        @businesses = @data["businesses"]
        @couriers_online = User.where(is_courier:true,is_online:true)
    end
    def checkout
        @order = Order.create(order_params)
        @order.user = User.find(session[:user_id])
        @order.save
        tip = (@order.tip*100).to_i
        location = @order.pulocation
        Stripe.api_key = 'sk_test_Ut6jJMDc0BI6g2N1ARNsvmFz00gUjr09pe'
        session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
            name: 'ABC Delivery From '.concat(location),
            description: 'ABC Delivery',
            images: ['https://example.com/t-shirt.png'],
            amount: 500 + tip,
            currency: 'usd',
            quantity: 1,
        }],
        success_url: 'http://localhost:3000/orders/success?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: 'http://localhost:3000/orders'
        )
        @data = session
        @order.stripe_id = session.id
        @order.save
    end
    def success
        @order = Order.find_by stripe_id:params[:session_id]
        @order.paid = true
        @order.save
        redirect_to '/orders/'.concat(@order.id)
    end
    def show
        @order = Order.find(params[:id])
        @courier = @order.delivered_by.last
    end
    private
    def order_params
        params.require(:order).permit(:pulocation,:puname,:putime,:puaddress,:puzipcode,:doaddress,:dozipcode,:notes,:tip,:step)
    end
end