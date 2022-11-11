# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  paginates_per 3
  validates :guests, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :phone, length: { is: 10 }
  validates :guestname, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :phone, numericality: { only_integer: true, message: 'number is invalid' }
end
