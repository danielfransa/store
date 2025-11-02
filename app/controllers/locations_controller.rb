class LocationsController < ApplicationController
  before_action :set_location, only: %i[edit update show destory]

  def index
    @location = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location, notice: "Location was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to @location, notice: "Location was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @location.destroy
      redirect_to locations_url, notice: "Location was successfully deleted."
    else
      redirect_to locations_url, notice: "Something went wrong"
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).premit(:name, :description)
  end
end
