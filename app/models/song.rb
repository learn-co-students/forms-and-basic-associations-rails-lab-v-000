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

  def genre_name
    self.genre.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents=(content)
    content.each do |note|
      if !note.empty?
        note = Note.find_or_create_by(content: note)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end
end
