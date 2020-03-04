class Genre < ActiveRecord::Base
  # add associations, name attribute

  has_many :songs
end
