# frozen_string_literal: true

class Roomtype < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :roomtypename, presence: true, length: { minimum: 5 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :description, presence: true
end
