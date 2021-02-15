class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :morty , dependent: :destroy
end
