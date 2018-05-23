class Movie < ApplicationRecord
  has_and_belongs_to_many :genres,optional: true
end