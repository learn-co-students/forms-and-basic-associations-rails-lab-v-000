class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != ""
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.collect{|note| note.content}
  end


end

