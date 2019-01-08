class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre != nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist != nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
        self.notes << Note.find_or_create_by(content: content)
      end
    end
  end

  def note_contents
    self.notes.collect { |note|
      if note.content != "" || note.content != nil
        note.content
      end
      }
  end

end
