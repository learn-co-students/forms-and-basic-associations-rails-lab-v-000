class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    artist_object = Artist.find_or_create_by(name: artist_name)
    artist_object.songs << self
  end

  def artist_name
    artist.name if artist
  end 

  def genre_name=(genre_name)
    genre_object = Genre.find_or_create_by(name: genre_name)
    genre_object.songs << self
  end

  def genre_name
    genre.name if genre
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != ''
        self.notes << Note.create(content: note)
      end
    end
  end

  def note_contents
    notes.map { |note| note.content }
  end
end