class ProductsController < ApplicationController
  before_action :set_shop
  before_action :set_product_collection_date
  before_action :set_product, only: [ :edit, :update, :destroy ]
  layout "shop", only: [ :index ] # Use the shop layout for the index action


  def new
    @product = @product_collection_date.products.build
  end

  def create
    @product = @product_collection_date.products.build(product_params)

    if @product.save
      respond_to do |format|
        format.html { redirect_to shop_path(@shop), notice: "Item was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Item was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to shop_path(@shop), notice: "Item was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Item was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to shop_path(@shop), notice: "Date was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :unit_price)
  end

  def set_shop
    @shop = current_company.shops.find(params[:shop_id])
  end

  def set_product_collection_date
    @product_collection_date = @shop.product_collection_dates.find(params[:product_collection_date_id])
  end

  def set_product
    @product = @product_collection_date.products.find(params[:id])
  end
end
