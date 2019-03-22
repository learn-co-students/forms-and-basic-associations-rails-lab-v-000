class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs
  has_many :notes, through: :songs
  has_many :genres, through: :songs
end
