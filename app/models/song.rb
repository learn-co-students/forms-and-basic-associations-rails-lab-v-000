class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def notes=(notes)
    notes.each do |note|
      if note != ""
        self.notes << Note.create(content: note)
      end
    end
  end

  def note_contents=(notes)
    self.notes=(notes)
  end

  def note_contents
    self.notes.collect{|n| n.content}
  end

end
