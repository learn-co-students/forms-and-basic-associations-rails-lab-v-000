class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    if self.artist != nil
      self.artist.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre != nil
      self.genre.name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
    if self.notes != nil
      content_array = []
      self.notes.each do |note|
        content_array << note.content
      end
    end
    content_array
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.blank?
        actual_note = Note.create(content: note)
        self.notes << actual_note
      end
    end
  end





end

