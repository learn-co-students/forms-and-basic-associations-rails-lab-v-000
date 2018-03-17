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


  def note_contents=(contents)
    contents.each do |content|
      self.notes << Note.create(content: content)
    end
  end

  def note_contents
    self.notes.collect{ |note| note.content}
  end
end

