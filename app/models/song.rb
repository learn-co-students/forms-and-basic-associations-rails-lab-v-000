class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
    # byebug
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
end
