class Artist < ActiveRecord::Base
  # add associations here
  validates_presence_of :name
  has_many :songs
end 
