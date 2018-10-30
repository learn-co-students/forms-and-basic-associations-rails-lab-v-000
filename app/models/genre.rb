class Genre < ActiveRecord::Base
  # add associations
  has_many :songs
  validates :name, presence: true
  
end
