class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :calamity, counter_cache: true
  belongs_to :user
end
