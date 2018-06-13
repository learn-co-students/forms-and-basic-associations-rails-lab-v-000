class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def notes=(notes)
    notes.each do |note|
      n = Note.find_or_create_by(content: note)
      self.notes << n
    end
  end

  def note_contents=(notes)
    notes.each do |content|
      if content != ""
        self.notes << Note.find_or_create_by(content: content)
      end
    end
  end

  def note_contents
    note_contents = []
    notes.each do |note|
      note_contents << note.content
    end
    note_contents
    # self.notes ? self.note_contents : nil
  end
end
