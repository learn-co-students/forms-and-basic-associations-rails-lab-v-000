class Artist < ActiveRecord::Base
  validates :name, presence: true
  # add associations here
  has_many :songs
end
