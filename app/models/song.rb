class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    
  end
end

