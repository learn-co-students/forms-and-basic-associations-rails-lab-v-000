class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
end
