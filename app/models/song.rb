class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name unless self.artist.nil?
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_name
    self.genre.name unless self.genre.nil?
  end

  def genre_name=(name)
    self.genre = Genre.find_by_name(name)
  end

  def notes=(notes)
    self.note_contents = notes
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != ""
        self.notes << Note.new(content: note)
      end
    end
  end
end
