class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  attr_reader :song_artist_name

  def song_artist_name=(name)
    self.artist = Artist.find_by(name: name)
  end

end
