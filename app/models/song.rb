class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes




  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
     contents.each do |content|
       if content != ""
         note = Note.find_or_initialize_by(content: content)
         self.notes << note
       end
     end
  end

  def note_contents
    self.notes ? self.notes.map {|note| note.content} : nil
  end

  def genre_name=(genre)
    genre = Genre.find_or_create_by(name: genre)
    self.genre = genre
  end

  def genre_name
    if self.genre
      self.genre.name
    else
      nil
    end
  end
end
