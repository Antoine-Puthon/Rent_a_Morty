class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :reservations
  has_many :morties
  has_many :reviews, inverse_of: :user

  validates :first_name, presence: true
  validates :last_name, presence: true

end
