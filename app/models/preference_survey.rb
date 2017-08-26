class PreferenceSurvey < ApplicationRecord
  belongs_to :user
  belongs_to :media
  belongs_to :shot
end
