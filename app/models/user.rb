class User < ActiveRecord::Base
  has_many :events

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, length: { in: 1..20}, on: :create
end
