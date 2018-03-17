class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist.name if self.artist
  end

   def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self.genre.name 
  end

  def note_contents=(note_contents)
      note_contents.each do |contents|
        unless contents == ""
        note = Note.find_or_create_by(content: contents)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end

end

