class Genre < ActiveRecord::Base
  # add associations
  validates_presence_of :name
  has_many :songs
end
