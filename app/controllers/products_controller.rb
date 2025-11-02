class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update show destory]
  def index
    @product = Product.all.order(:id)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was sucessfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was sucessfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_url, notice: "Product was sucessfuly deleted."
    else
      redirect_to products_url, notice: "Something went wrong"
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).premit(:name, :description, :brand, :price_base)
  end
end
