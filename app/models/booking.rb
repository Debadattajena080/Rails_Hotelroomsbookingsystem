# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :guests, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :phone, length: { is: 10 }
  validates :guestname, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validate :overlapping_bookings

  def overlapping_bookings
    if Booking.where(room_id: room_id).where('? < end_date AND start_date < ?', start_date, end_date).any?
      errors.add(:base, 'This room is already booked for these dates')
    end
  end
end
