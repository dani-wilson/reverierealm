class User < ApplicationRecord
  has_secure_password 
  
  validates_presence_of :username, allow_nil: false, uniqueness: true
  validates :email,
  format: { with: /\A(.+)@(.+)\z/ },
  uniqueness: true,
  presence: true
  validates :password_digest, presence: true, confirmation: true
  has_secure_password

  has_many :dreams
end