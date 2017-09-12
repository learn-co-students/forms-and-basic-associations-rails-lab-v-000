class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist
  end

  def note_contents=(notes)
      notes.each do |content|
      self.notes.build(content: content) if !content.strip.empty?
    end
  end

  def note_contents
    self.notes.map{|note| note.content}
  end
end

