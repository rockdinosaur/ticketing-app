class User < ActiveRecord::Base
  has_many :tickets
  has_many :comments

  has_secure_password validations: false

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, confirmation: true
  validates_confirmation_of :password
end
