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
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)

  end

  def genre_name
    self.genre.name
  end

  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
        note = Note.find_or_create_by(content: content)
        self.notes << note
        #byebug
      end
    end

  end

  def note_contents
    if self.notes
      self.notes.collect do |note|
        note.content
      end
    end
  end
end
