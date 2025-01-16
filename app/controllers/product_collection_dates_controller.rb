class ProductCollectionDatesController < ApplicationController
  before_action :set_shop
  before_action :set_product_collection_date, only: [ :edit, :update, :destroy ]

  def new
    @product_collection_date = @shop.product_collection_dates.build
  end

  def create
    @product_collection_date = @shop.product_collection_dates.build(product_collection_date_params)

    if @product_collection_date.save
      redirect_to shop_path(@shop), notice: "Date was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    if @product_collection_date.update(product_collection_date_params)
      respond_to do |format|
        format.html { redirect_to shop_path(@shop), notice: "Date was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product_collection_date.destroy

    respond_to do |format|
      format.html { redirect_to shop_path(@shop), notice: "Date was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
    end
  end

  # Privare methods from here
  private def product_collection_date_params
    params.require(:product_collection_date).permit(:date)
  end

  private def set_product_collection_date
    @product_collection_date = @shop.product_collection_dates.find(params[:id])
  end

  private

    def set_shop
      @shop = current_company.shops.find(params[:shop_id])
    end
end
