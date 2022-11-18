class Address::Barangay < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :city_municipality, optional: true
  belongs_to :district, optional: true
  belongs_to :province, optional: true
end
