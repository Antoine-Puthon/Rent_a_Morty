class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :morty
  enum progress: { pending: 0, confirmation: 1, abordation: 2 }
end
