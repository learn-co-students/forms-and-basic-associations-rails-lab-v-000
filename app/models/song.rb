class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if genre
  end

  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
        self.notes << Note.find_or_create_by(content: content)
      end
    end
  end

  def note_contents
    notes = []
    self.notes.each do |note|
      notes << note.content
    end
    notes
  end

end
