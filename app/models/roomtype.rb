# frozen_string_literal: true

class Roomtype < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :roomtypename, presence: true, length: { minimum: 5 }
  validates :description, presence: true
end
