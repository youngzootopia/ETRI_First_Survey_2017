class Filtering < ApplicationRecord
  belongs_to :user, :dependent => :destroy
end
