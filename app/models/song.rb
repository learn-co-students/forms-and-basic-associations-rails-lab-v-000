class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #custom setter for artist name
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #reader for artist name
  def artist_name
    self.artist.name if self.artist 
  end

  #custom setter for note contents from array params
  def note_contents=(notes)
    notes.each do |note|
      if note.strip != ""
        content = self.notes.build(content: note)
        content.save
      end
    end
  end

  #reader for note contents
  def note_contents
    self.notes.collect {|note| note.content }
  end

end

