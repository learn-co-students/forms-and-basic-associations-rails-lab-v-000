class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : "N/A"
  end

  def note_contents
    notes.map(&:content).reject(&:empty?)
  end

  def note_contents=(note_contents_array)
    note_contents_array.each do |note|
      notes.build(content: note)
    end
  end

  def genre_name
    genre.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

end
