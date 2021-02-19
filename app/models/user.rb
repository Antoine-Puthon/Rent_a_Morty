class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :reservations
  has_many :morties
  has_many :reviews, inverse_of: :user
  validates :first_name, :last_name,  presence: true
  has_one_attached :photo

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
  
  def confirmations
    self.reservations.where(progress: :confirmation)
  end

end
