# frozen_string_literal: true

class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    @rooms = @hotel.rooms
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:success] = 'Hotel created successfully'
      redirect_to @hotel
    else
      render 'new'
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      flash[:success] = 'Hotel updated successfully'
      redirect_to @hotel
    else
      flash.now[:danger] = 'Hotel was not updated'
      render 'edit'
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to hotels_path
    flash[:danger] = 'Hotel deleted successfully'
  end

  def rooms
    @hotel = Hotel.find(params[:id])
    @rooms = @hotel.rooms
  end

  def search
    @hotels = Hotel.where('city LIKE ?', "%#{params[:q]}%")
  end

  private

  def hotel_params
    params.require(:hotel).permit(:hotelname, :city, :address, :about, :latitude, :longitude, :image)
  end
end
