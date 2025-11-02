class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show edit update destroy]
  before_action :set_dependencies, only: %i[new create edit update]

  def index
    @inventories = Inventory.include(:sku, :location)
  end

  def show; end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      redirect_to @inventory, notice: "Inventory entry was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @inventory.update(inventory_params)
      redirect_to @inventory, notice: "Inventory was sucessfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @inventory.destroy
      redirect_to inventories_url, notice: "Inventory record was deleted successfully"
    else
      redirect_to inventories_url, notice: "Something went wrong!"
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def set_dependencies
    @skus = Sku.all
    @locations = Location.all
  end

  def inventory_params
    params.require(:inventory).permit(:sku_id, :location_id, :quantity)
  end
end
