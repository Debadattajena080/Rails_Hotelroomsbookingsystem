# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :bookings, dependent: :destroy
  has_many :rooms, through: :bookings

  before_save { self.username = username.titleize }
  validates :username, format: { with: /\A[a-zA-Z0-9]+\z/ }
  before_save { self.email = email.downcase }
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :contact, numericality: { only_integer: true, message: 'number is invalid' },
                      length: { is: 10 }

  validates :password, length: { minimum: 6 }
end
