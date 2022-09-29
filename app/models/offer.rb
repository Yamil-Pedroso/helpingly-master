class Offer < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_location_and_category,
  using: { tsearch: { prefix: true } }

  validates :title, :description, :hourly_rate, :location, :photo, :category, presence: true
  validates :category, inclusion: { in: %w[Home Sports Education Pets Arts Music Garden Other] }
end
