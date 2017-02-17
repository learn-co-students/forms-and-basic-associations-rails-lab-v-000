class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist
  end

  def song_genre_id=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def song_genre_id
    self.genre
  end

end

