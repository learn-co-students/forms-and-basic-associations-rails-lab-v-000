class Song < ActiveRecord::Base
  attr_reader :artist_name, :notes_1, :notes_2

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    @artist_name = self.artist.name
  end

  def notes_1=(content)
    add_to_notes(content)
  end

  def notes_2=(content)
    add_to_notes(content)
  end

  def note_contents
    contents = []
    self.notes.each do |note|
      contents << note.content
    end

    contents
  end

  def note_contents=(notes)
    notes.reject!(&:empty?)
    notes.each do |note|
      new_note = Note.create(content: note)
      self.notes << new_note
    end
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  protected
  def add_to_notes(content)
    note = Note.create(content: content)
    self.notes << note
  end

end
