require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_artist_name
    self.artist
  end

  def note_contents=(notes)
    notes.each do |content|
      note = Note.create(content: content)
      self.notes << note
    end
  end

  def note_contents
    self.notes
  end
end
