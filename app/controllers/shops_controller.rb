class ShopsController < ApplicationController
  before_action :set_shop, only: [ :show, :edit, :update, :destroy ]

  helper_method :get_quote, :get_last_updated_shop
  def get_shop
    @shop
  end

  def get_last_updated_shop
    current_company.shops.order(updated_at: :desc).first
  end

  def index
    @shops = current_company.shops.ordered
  end

  def show
    @product_collection_dates = @shop.product_collection_dates.includes(:products).ordered
  end

  def new
    # debugger
    @shop = Shope.new
  end

  def create
    @shop = current_company.shops.build(shop_params)

    if @shop.save
      @shops = current_user.company.shops
      respond_to do |format|
        format.html { redirect_to shops_path, notice: "HTML: Shop was successfully created." }
        format.turbo_stream { flash.now[:notice] = "STREAM: Shop was successfully created." }
      end
    else
      flash[:error] = "Shop could not be created! Check Errors!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @Shop.update(Shop_params)
      @Shops = current_user.company.Shops
      respond_to do |format|
        format.html { redirect_to Shops_path, notice: "Shop was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Shop was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_path, notice: "Shop was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Shop was successfully destroyed." }
    end
  end

  private

  def set_shop
    @shop = current_company.shops.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name)
  end
end
