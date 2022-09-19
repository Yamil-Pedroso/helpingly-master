class Offer < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, :description, :hourly_rate, :location, :photo, :category, presence: true
  validates :category, inclusion: { in: %w[Home Sports Education Pets Arts Music Garden Other] }
end
