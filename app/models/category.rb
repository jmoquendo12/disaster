class Category < ApplicationRecord
  validates :name, presence: true

  has_many :calamity_category_ships
  has_many :calamities, through: :calamity_category_ships
end
