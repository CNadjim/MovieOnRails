class Critical < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :tvshow
end
