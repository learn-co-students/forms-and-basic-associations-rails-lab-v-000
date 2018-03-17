class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents
    self.notes.collect{|n| n.content}
  end

  def note_contents=(message_array)
    message_array.each do |message|
      n = self.notes.build(content: message)
      n.save
    end
  end
end
