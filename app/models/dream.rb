class Dream < ApplicationRecord
  validates_presence_of :dream_title 
  validates_presence_of :user_id
  validates_presence_of :dream_content
  validates_presence_of :dream_date
  validates_presence_of :privacy_setting
  validates_presence_of :favorite
  validates_presence_of :additional_insights

  belongs_to :user
end