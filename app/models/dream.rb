class Dream < ApplicationRecord
  validates_presence_of :dream_title 
  validates_presence_of :user_id
  validates_presence_of :dream_content
  validates_presence_of :dream_date
  validates_presence_of :privacy_setting, allow_blank: true
  validates_presence_of :favorite, allow_blank: true
  validates_presence_of :additional_insights, allow_blank: true

  belongs_to :user
end