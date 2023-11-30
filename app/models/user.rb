class User < ApplicationRecord
  has_secure_password 
  
  validates_presence_of :username, allow_nil: false
  validates_presence_of :email, uniqueness: true
  validates :password_digest, presence: true, confirmation: true
  has_secure_password

  has_many :dreams
end