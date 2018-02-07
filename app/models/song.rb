class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    artist = self.artist = Artist.find_or_create_by(name: name)
    artist.save
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note) if !note.empty?
    end
    self.save
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def genre_name=(genre)
    # binding.pry
    self.build_genre(name: genre)
    self.save
  end

  def genre_name
    self.genre.name
  end
end

