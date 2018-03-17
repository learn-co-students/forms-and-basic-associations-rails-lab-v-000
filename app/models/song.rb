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
    self.notes.collect {|note| note.content}
  end

  def note_contents=(array)
    array.each do |note_content|
      note = self.notes.build(content: note_content)
      note.save
      end    
  end

end

