class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    try(:genre).try(:name)
  end

  def artist_name=(artist)
    artist = Artist.find_or_create_by(name: artist)
    self.artist = artist
  end

  def artist_name
    try(:artist).try(:name)
  end

  def note_contents=(note_array)
    note_array.each do |note|
      notes.new(content: note, song_id: id) unless note == ''
    end
  end

  def note_contents
    notes.collect(&:content)
  end
end
