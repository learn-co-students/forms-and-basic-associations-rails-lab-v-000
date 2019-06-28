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

  def song_notes_1=(content)
    self.notes << Note.find_or_create_by(content: content)
  end

  def song_notes_1
     self.notes ? self.notes : nil
  end

  def song_notes_2=(content)
    self.notes << Note.find_or_create_by(content: content)
  end

  def song_notes_2
     self.notes ? self.notes : nil
  end

  def note_contents=(note_contents)
    note_contents.each do |note_content|
      note = Note.create(content: note_content)
      self.notes << note
    end
  end

  def note_contents
    note_contents = []
    self.notes.each do |note|
      note_contents << note.content
    end
    note_contents.reject(&:blank?)
  end
end
