class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre= Genre.find_or_create_by(name: name)
  end

  def artist_name=(name)
    self.artist= Artist.find_or_create_by(name: name)
  end

  def note_contents=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end
end
