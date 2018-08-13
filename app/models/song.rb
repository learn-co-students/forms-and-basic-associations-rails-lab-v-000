class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def note_contents
    self.notes.map {|n| n.content }
  end

  def note_contents=(notes)
    notes.each do |note|
      new_note = Note.find_or_create_by(content: note) unless note == ""
      self.notes << new_note unless new_note == nil
    end

  end


  
end

