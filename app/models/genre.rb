class Genre < ActiveRecord::Base
  validates :name, presence: true
  # add associations
  has_many :songs
end
