class Artist < ActiveRecord::Base
  has_many :songs
  has many :genres, through: :songs
end
