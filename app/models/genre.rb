class Genre < ApplicationRecord
  has_many :movies
  has_many :tvshows
end
