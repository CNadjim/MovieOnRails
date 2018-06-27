class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :tvshow
  belongs_to :user
end
