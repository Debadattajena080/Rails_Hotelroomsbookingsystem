# frozen_string_literal: true

class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :roomtypes, through: :rooms

  has_one_attached :image

  validates :hotelname, presence: true
  validates :about, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
