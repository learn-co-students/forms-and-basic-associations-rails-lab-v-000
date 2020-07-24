class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
        note = Note.create(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    if self.notes
      self.notes.map do |note|
        note.content
      end
    else
      nil
    end
  end

end
