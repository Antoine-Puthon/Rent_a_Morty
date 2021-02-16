class Morty < ApplicationRecord

   RARITY = ["common", "rare", "epic"]
   STATE = ["hurt","relaxed","depressed","angry"]
   PRICE = ["<50","50-100", "100-200",">200"]

  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :description, presence: true

  validates :state, inclusion: { in: STATE,
      message: "%{value} is not a valid state type" }, presence: true

  validates :rarity, inclusion: { in: RARITY,
      message: "%{value} is not a valid rarity type" }, presence: true


end
