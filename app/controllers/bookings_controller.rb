# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @user = User.find(session[:user_id])
    @bookings = @user.bookings.order('created_at DESC').page(params[:page])
  end

  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
  end


  def create
    @room = Room.find(params[:room_id])
    @booking = @room.bookings.create(booking_params)
    @booking.user_id = Current.user.id
    if @booking.save
      redirect_to root_path
      flash[:success] = 'Booking is created successfully and pending for approval'
    else
      render 'new'
    end
  end



  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :room_id, :phone, :guests, :guestname,
                                    :number_of_room)
  end

  def adding_total_rooms_after_end_date
    @booking = Booking.find(params[:id])
    @room = Room.find(@booking.room_id)
    if @booking.end_date < Date.today
      @room.update_attribute(:total_rooms, @room.total_rooms += @booking.number_of_room)
    end
  end

  

end
