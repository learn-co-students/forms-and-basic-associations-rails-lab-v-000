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

  def genre_id=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_id
    self.genre
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end
 
  def note_contents
    self.notes.collect{|note| note.content}
  end
=begin
  def note_contents=(notes)
    notes.each do |note|
      self.notes << note
    end
  end

  def note_contents
    self.notes
  end
=end

end

