class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    unless artist.nil?
      artist.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_id
    unless genre.nil?
      genre.name
    end
  end

  def genre_id=(genre_id)
    self.genre = Genre.find(genre_id)
  end

  def note_contents
    self.notes.map(&:content)
  end

  def note_contents=(notes)
    notes.collect do |note|
      unless note == ""
        self.notes.build(content: note)
      end
    end
  end
end
