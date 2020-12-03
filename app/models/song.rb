class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def note_contents
    self.notes.map {|note| note.content}
  end

  def note_contents=(contents)
    contents.each do |c|
      if !c.empty?
        note = Note.create(content: c, song_id: self.id)
        self.notes << note
      end
    end
  end
end
