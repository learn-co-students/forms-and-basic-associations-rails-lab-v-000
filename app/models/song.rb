class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(:name => name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(:name => name)
  end

  def artist_name
    self.try(:artist).try(:name) 
  end

  #  note_contents
  #    returns the content of all notes as an array (FAILED - 6)
  #  note_contents=
  #    sets notes for a song (FAILED - 7)
  #    adds to existing notes (FAILED - 8)
  #    ignores blank notes (FAILED - 9)

  def note_contents=(content)
  end
  
  def note_contents
  end
end
