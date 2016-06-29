class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def sales
    @orders = Order.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.where(buyer: current_user).order("created_at DESC")
  end

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
    @seller = @listing.user
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params.merge(address: stripe_params["stripeShippingAddressLine1"],
                                          city: stripe_params["stripeShippingAddressCity"],
                                          state: stripe_params["stripeShippingAddressState"],
                                          zipcode: stripe_params["stripeShippingAddressZip"],
                                          shipping_name: stripe_params["stripeShippingName"]
                                          )
                      )
    @listing = Listing.find(params[:listing_id])
    @seller = @listing.user
    @amount = (@listing.price * 100 * @order.ordered_amount).floor

    @order.listing_id = @listing.id
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id

    # preserve information for history
    @order.listing_name = @listing.name
    @order.listing_price = @listing.price
    @order.buyer_name = current_user.name
    @order.seller_name = @seller.name
    @order.total = @amount

    
    Stripe.api_key = @seller.access_code

    begin
      customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source => params[:stripeToken])
        
      charge = Stripe::Charge.create({
          :customer => customer.id,
          :amount => @amount,
          :currency => "usd"},
          {:stripe_account => @seller.uid}
      )
      
      flash[:notice] = "Thanks for ordering!"
 
      
      rescue Stripe::CardError => e
          flash[:error] = e.message
          redirect_to new_charge_path
    end



    respond_to do |format|
      if @order.save
        ShippingMailer.mail_to_buyer(@order).deliver
        ShippingMailer.mail_to_seller(@order).deliver
        @order.decrease_quantity
        format.html { redirect_to root_url }
        format.json { render action: 'show', status: :created, location: @order }

      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stripe_params
      params.permit(:stripeShippingAddressLine1, :stripeShippingAddressState, :stripeShippingAddressCity, :stripeShippingName, :stripeShippingAddressZip)
    end

    def order_params
      params.require(:order).permit(:ordered_amount, stripe_params)
    end

    
end