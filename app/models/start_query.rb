class StartQuery < ApplicationRecord
  belongs_to :user
  has_one :stories
end
