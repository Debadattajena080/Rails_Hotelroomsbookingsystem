# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :guests, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :phone, length: { is: 10 }
  validates :guestname, format: { with: /\A[a-zA-Z0-9]+\z/ }
  
end
