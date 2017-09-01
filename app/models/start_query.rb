class StartQuery < ApplicationRecord
  belongs_to :user
  has_one :stories
  has_many :StartQueryTags
end
