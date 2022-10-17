# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order('hotel_id ASC')
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @hotels = Hotel.all
    @roomtypes = Roomtype.all
    @room = Room.new
  end

  def create
    @hotels = Hotel.all
    @roomtypes = Roomtype.all
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = 'Room created successfully'
      redirect_to @room
    else
      render 'new'
    end
  end

  def edit
    @hotels = Hotel.all
    @roomtypes = Roomtype.all
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:success] = 'Room updated successfully'
      redirect_to @room
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
    flash[:danger] = 'Room deleted successfully'
  end

  private

  def room_params
    params.require(:room).permit(:price, :roomtype_id, :hotel_id, :image)
  end
end
