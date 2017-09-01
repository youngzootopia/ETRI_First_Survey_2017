class Shot < ApplicationRecord
  belongs_to :media
  has_many :StartQueryTags
end
