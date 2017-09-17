class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    if name != ""
       self.artist = Artist.find_or_create_by(name: name)
     end
  end

  def genre_name=(name)
    if genre != ""
      self.genre = Genre.find_or_create_by(name: name)
    end
  end

  def artist_name
    self.artist.name unless self.artist == nil
  end

  def genre_name
    self.genre.name unless self.genre == nil
  end

  def note_contents=(note)
    note.each do |note|
      if note != ""
        note = Note.find_or_create_by(content: note)
        self.notes << note
      end
    end
  end

  def note_contents
     self.notes.collect do |n|
       n.content
     end
  end

end
