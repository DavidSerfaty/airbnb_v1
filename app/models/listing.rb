class Listing < ApplicationRecord
  validates :available_beds, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 140 }
  validates :welcome_message, presence: true

  belongs_to :city
  belongs_to :owner, class_name: "User"

  has_many :reservations
  has_many :guests, through: :reservations, source: :guest

end
