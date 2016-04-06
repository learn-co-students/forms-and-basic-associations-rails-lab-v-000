class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    if artist
      self.artist.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    notes.reduce([]) do |contents,note|
      contents << note.content
    end
  end

  def note_contents=(contents)
    contents.each do |content|
      notes.build(content: content)
    end
  end
end
