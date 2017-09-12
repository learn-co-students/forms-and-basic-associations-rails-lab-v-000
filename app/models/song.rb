require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    if artist
      artist.name
    end
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by(name: name)
    self.artist_id = @artist[:id]
  end

  def note_contents
    self.notes.map{ |note| note.content}
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

end

