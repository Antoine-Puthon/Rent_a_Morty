class Review < ApplicationRecord
   belongs_to :user
   belongs_to :morty
  validates :content, :rating, presence: true
end
