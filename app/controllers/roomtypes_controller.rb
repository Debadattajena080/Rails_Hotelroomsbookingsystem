# frozen_string_literal: true

class RoomtypesController < ApplicationController

  before_action :require_admin, only: %i[index new create edit update destroy]

  def index
    @roomtypes = Roomtype.all
  end

  def show
    @roomtype = Roomtype.find(params[:id])
  end

  def new
    @hotels = Hotel.all
    @roomtype = Roomtype.new
  end

  def create
    @hotels = Hotel.all
    @roomtype = Roomtype.new(roomtype_params)
    if @roomtype.save
      flash[:success] = 'Roomtype created successfully'
      redirect_to @roomtype
    else
      render 'new'
    end
  end

  def edit
    @roomtype = Roomtype.find(params[:id])
  end

  def update
    @roomtype = Roomtype.find(params[:id])
    if @roomtype.update(roomtype_params)
      flash[:success] = 'Roomtype updated successfully'
      redirect_to @roomtype
    else
      flash.now[:danger] = 'Roomtype was not updated'
      render 'edit'
    end
  end

  def destroy
    @roomtype = Roomtype.find(params[:id])
    @roomtype.destroy
    redirect_to roomtypes_path
    flash[:danger] = 'Roomtype deleted successfully'
  end

  private

  def roomtype_params
    params.require(:roomtype).permit(:roomtypename, :description)
  end
end
