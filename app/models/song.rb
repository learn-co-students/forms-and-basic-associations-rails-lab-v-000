class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.try(:artist).try(:name)
  end
# .try is look for an object, and return nil if it doesn't detect it instead of error

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

end
