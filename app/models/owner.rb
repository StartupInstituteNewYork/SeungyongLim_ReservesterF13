class Owner < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants, dependent: :destroy
  has_many :reservations, through: :restaurants
  validates :name, presence: true
  validates :email, presence: true

end
