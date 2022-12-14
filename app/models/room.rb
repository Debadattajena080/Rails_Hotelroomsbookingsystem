# frozen_string_literal: true

class Room < ApplicationRecord

  paginates_per 3
  belongs_to :hotel
  belongs_to :roomtype
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  has_one_attached :image

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :total_rooms, presence: true, numericality: { greater_than: 0 }
end
