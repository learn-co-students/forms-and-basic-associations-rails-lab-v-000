class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs

  validates :name, presence: true
end
