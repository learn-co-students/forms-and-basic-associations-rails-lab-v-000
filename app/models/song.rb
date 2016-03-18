class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :artist_name

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    notes.collect {|note| note.content}
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end
end
