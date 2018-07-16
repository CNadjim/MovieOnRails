class Critical < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :movie, required: false
  belongs_to :tvshow, required: false
end
