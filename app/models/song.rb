class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if artist
      self.artist.name
    else
      nil
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if genre
      self.genre.name
    else
      nil
    end
  end

  def note_contents=(content)
    content.each do |note|
      unless note.strip.empty?
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end
end

