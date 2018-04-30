class Song < ActiveRecord::Base

  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
      if self.artist
        self.artist.name
      end
      #self.try(:artist).try(:name)
  end

  def genre_id=(id)
    genre = Genre.find_or_create_by(id: id)
    self.genre = genre
  end

  def genre_id
    if self.genre
      self.genre.id
    end
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
      if self.genre
        self.genre.name
      end
  end


  def note_contents=(notes)
    notes.each do |note_content|
      if note_content != ""
        @note = Note.find_or_create_by(content: note_content)
        self.notes << @note
      end
    end
  end

  def note_contents #needs to return an array of all of the song notes contents

    if self.notes
      self.notes.collect do |note|
        note.content
      end
    end

  end


end
