class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name:genre)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name:artist)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(contents)
    contents.each do |note|
      unless note == "" || note == nil
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.map{|note| note.content}
  end

end
