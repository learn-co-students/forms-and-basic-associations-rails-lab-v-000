class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def song_notes=(notes)
    notes.each do |n|
      note = Note.create_by(content: n)
      self.notes << note
    end
  end

  def song_notes
    self.notes
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

end