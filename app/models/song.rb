class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre_name)
    genre = Genre.find_or_create_by(name: genre_name)
    self.genre = genre
    self.save
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by(name: artist_name)
    self.artist = artist
    self.save
  end

  def note_contents=(note_contents)
    note_contents.each do |note_content|
      note = Note.new(content: note_content)
      if note.save
        self.notes << note
        self.save
      end
    end
  end

  def genre_name
    if self.genre
      return self.genre.name
    else
      return nil
    end
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      return nil
    end
  end

  def note_contents
    self.notes.collect{|note| note.content}
  end
end
