
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    # self.artist.name if self.artist  - diff btw this and below? 
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
    #self.try(:genre).try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end


  def note_contents
    self.notes
  end

  def note_contents=(notes)
    notes.each do |note|
      note = Note.find(note)
      self.notes << note
    end
  end

end

