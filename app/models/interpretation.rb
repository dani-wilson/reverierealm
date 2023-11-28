class Interpretation < ApplicationRecord
  validates_presence_of :dream_id
  validates_presence_of :interpretation_content

  belongs_to :dream
end