class Tvshow < ApplicationRecord
  has_and_belongs_to_many :genres,optional: true
  has_many :comments, dependent: :destroy
  has_many :criticals, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def self.search(search)
    if search
      where('name LIKE ?',"#{search}")
    else
      all
    end
  end
end
