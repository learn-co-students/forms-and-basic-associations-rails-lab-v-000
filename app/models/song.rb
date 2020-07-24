class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(gname)
    g = Genre.find_or_create_by(name: gname)
    self.genre = g
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note).save if note.length > 0
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def note_ids=(ids)
    ids.each do |id|
      id_num = id.chars.last.to_i
      note = Note.find_or_create_by(id: id_num)
      self.notes << note
    end
  end

  def note_ids
    self.notes.map do |note|
      "song_notes_#{note.id}"
    end
  end

end
