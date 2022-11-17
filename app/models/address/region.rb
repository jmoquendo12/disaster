class Address::Region < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  has_many :city_municipalities
  has_many :provinces
  has_many :districts
  # has_many :calamities, class_name: 'Calamity', foreign_key: 'address_region_id'
end
