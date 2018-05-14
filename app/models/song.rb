class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    # self.genre.name
    self.try(:genre).try(:name)
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    # self.artist.name
    self.try(:artist).try(:name)
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note).save if note != ""
    end
  end

  def note_contents
    self.notes.collect{|n| n.content}
  end
end
