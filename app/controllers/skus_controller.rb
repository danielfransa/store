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
      redirect_to @sku, notice: "SKU criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @sku.update(sku_params)
      redirect_to @sku, notice: "SKU atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sku.destroy
    redirect_to skus_path, notice: "SKU excluído com sucesso."
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
