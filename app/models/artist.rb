class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  #alidates :name, presence: true
end
