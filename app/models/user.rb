class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable

  has_many :habits, dependent: :destroy
  has_many :days, dependent: :destroy
end
