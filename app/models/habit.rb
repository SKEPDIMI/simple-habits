class Habit < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
