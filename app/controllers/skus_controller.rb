class SkusController < ApplicationController
  before_action :set_sku, only: %i[edit update show destory]
  before_action :set_product, only: %i[new create]

  def index
    @skus = Sku.includes(:product).order(:code)
  end

  def show
  end

  def new
    @sku = @product.skus.build
  end

  def create
    @sku = @product.skus.build(sku_params)
    if @sku.save
      redirect_to @sku, notice: "SKU was sucessfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @sku.update(sku_params)
      redirect_to @sku, notice: "SKU was sucessfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @sku.destroy
      redirect_to skus_url, notice: "SKU was sucessfuly deleted."
    else
      redirect_to skus_url, notice: "Something went wrong"
    end
  end

  private

  def set_sku
    @sku = Sku.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def sku_params
    params.require(:sku).permit(:product_id, :code, :color, :size, :price)
  end
end
