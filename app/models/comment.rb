class Comment < ApplicationRecord
  belongs_to :movie ,required: false
  belongs_to :tvshow, required: false
  belongs_to :user, required: true
end
