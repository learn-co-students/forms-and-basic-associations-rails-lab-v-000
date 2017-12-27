class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name

    if self.artist
      self.artist.name
    else
      "No Artist"
    end

  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name

    if self.genre
      self.genre.name
    else
      "No Genre"
    end

  end

  def note_contents=(notes_array)
    notes_array.each do |note|
      if !note.empty?
        self.notes << Note.find_or_create_by(content: note)
      end
    end
  end

  def note_contents
    notes_array = []

    self.notes.each do |note|
      notes_array << note.content
    end
    notes_array
  end

end
