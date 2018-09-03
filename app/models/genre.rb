class Genre < ActiveRecord::Base
  has_many :songs
  # add associations
end
