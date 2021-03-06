class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def seller
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all.no_zeroes.order("created_at DESC")
    filtering_params(params).each do |key, value|
      @listings = @listings.public_send(key, value) if value.present?
    end
    @listings = @listings.paginate(:page => params[:page], :per_page => 12)

    #if params[:search]
    #  @listings = Listing.no_zeroes.search(params[:search]).paginate_default(params[:page]).order_default(params[:order])
    #elsif params[:name]
    #  @listings = Listing.no_zeroes.where(user: params[:name]).paginate_default(params[:page]).order_default(params[:order])
    #elsif params[:category]
    #  @category_id = [params[:category]]
    #  @subcategories = Category.find_all_heirs(@category_id)
    #  @listings = Listing.no_zeroes.where(category_id: @category_id + @subcategories).paginate_default(params[:page]).order_default(params[:order])
    #else
    #  @listings = Listing.all.no_zeroes.paginate_default(params[:page]).order_default(params[:order])
    #end
    #@listings = @listings
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end
  
  # GET /listings/new
  def new
    if current_user.publishable_key
      @listing = Listing.new
    else
      redirect_to user_stripe_connect_omniauth_authorize_path
    end
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render action: 'new' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :description, :price, :quantity, :trade, {images: []}, :category_id)
    end

    def filtering_params(params)
      params.slice(:ordering, :page, :keyword, :category, :named)
    end

    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, this cosplay item does not belong to you."
      end
    end
end
