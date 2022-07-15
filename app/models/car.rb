class Car < ApplicationRecord
  # relationships
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :reservations, dependent: :destroy

  # validations
  validates :car_model, presence: true
  validates :car_type, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :transmission, presence: true
  validates :description, presence: true

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
