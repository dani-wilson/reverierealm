class User < ApplicationRecord
  has_secure_password 
  
  validates_presence_of :username
  validates_presence_of :email

  has_many :dreams
end