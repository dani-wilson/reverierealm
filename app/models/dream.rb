class Dream < ApplicationRecord
  validates_presence_of :dream_title 
  validates_presence_of :dream_content
  validates_presence_of :dream_date
  validates_presence_of :privacy_setting
  validates_presence_of :favorite
  validates_presence_of :additional_insights
  validates_presence_of :user_id

  belongs_to :user
end