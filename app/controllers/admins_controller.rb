# frozen_string_literal: true

class AdminsController < ApplicationController
  before_action :require_admin

  def pending_bookings
    @bookings = Booking.where(is_approved: false).order('created_at DESC')
  end

  def confirmed_bookings
    @bookings = Booking.where(is_approved: true).order('created_at DESC')
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to admins_path, notice: 'Booking was successfully updated.'
  end

  def approve_booking
    @booking = Booking.find(params[:id])
    if @booking.update_attribute(:is_approved, true)
      @room = Room.find(@booking.room_id)
      @room.update_attribute(:total_rooms, @room.total_rooms -= @booking.number_of_room)
      RespondMailer.booking_approved(@booking).deliver_now
      redirect_to admins_pending_bookings_path,
                  flash: { success: 'Booking Approved' }
    end
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    RespondMailer.booking_rejected(@booking).deliver_now
    if @booking.update_attribute(:is_approved, false)
      @booking.destroy
      redirect_to admins_pending_bookings_path,
                  flash: { success: 'Booking Rejected' }
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:is_approved)
  end
end
