class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update destroy]

  def index
    @sales = Sale.includes(:client, :sale_items).order(created_at: :desc)
  end

  def show
  end

  def new
    @sale = Sale.new
    @sale.sale_items.build
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to @sale, notice: "Sale was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @sale.update(sale_params)
      redirect_to @sale, notice: "Sale was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @sale.destroy
      redirect_to sales_url, notice: "Sale was successfully deleted."
    else
      redirect_to sales_url, alert: "Something went wrong while deleting."
    end
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(
      :client_id,
      :date,
      sale_items_attributes: %i[id inventory_id quantity unit_price _destroy]
    )
  end
end
