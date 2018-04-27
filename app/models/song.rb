class Song < ActiveRecord::Base

  def song_artist_name=(name)
    self.artist Artist.find_or_create_by(name: name)
  end

  def song_artist_name
      self.artist.name
  end
  
  belongs_to :artist
  belongs_to :genre
  has_many :notes



end
