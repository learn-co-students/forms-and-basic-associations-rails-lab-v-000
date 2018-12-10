class Artist < ActiveRecord::Base
  has_many :songs
  # add associations here
end
