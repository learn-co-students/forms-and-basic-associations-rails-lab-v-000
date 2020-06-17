class Song < ActiveRecord::Base
  # add associations here
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

  def note_contents=(notes)
    notes.each do |note|
      current_note = Note.find_or_create_by(content: note)
      self.notes << current_note
    end
  end

  def note_contents
    # binding.pry
    note_array = []
    self.notes.map do |note|
      if note.content != ""
        note_array << note.content
      end
    end
    note_array.uniq
  end
end
