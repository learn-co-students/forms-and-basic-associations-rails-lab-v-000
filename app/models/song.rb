class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end



  def genre_ids=(ids)
    ids.each do |id|
      genre = Genre.find(id)
      self.genres << genre
    end
  end


end
