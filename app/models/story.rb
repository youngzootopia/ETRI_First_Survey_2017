class Story < ApplicationRecord
  belongs_to :user
  belongs_to :start_query
end
