class Review < ApplicationRecord
 belongs_to :user, inverse_of: :reviews
 belongs_to :morty
 validates :description, presence: true
 validates :rating, inclusion: { in: 0..5 }
 validates :morty_id, uniqueness: { scope: :user_id, message: "You've reviewed this morty!" }

end
