class Artist < ActiveRecord::Base
  has_many :songs

  def self.find_or_create_by(name:)
    self.find_by(name: name) || self.create(name: name)
  end
end
