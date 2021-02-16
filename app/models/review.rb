class Review < ApplicationRecord
   belongs_to :user
   belongs_to :morty
  validates :description, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
