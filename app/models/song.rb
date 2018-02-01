class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents=(contents)
    contents.reject(&:blank?).each { |content|
    self.notes.build(content: content)
    }
  end

  def note_contents
  self.notes.map { |note| note.content }
  end

  def notes=(ids)
     ids.each do |id|
       note = Note.find(id)
       self.notes << note
     end
   end
end
