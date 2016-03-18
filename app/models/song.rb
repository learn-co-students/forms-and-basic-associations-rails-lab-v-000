class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    artist.name if artist
  end

  def notes=(notes_arr)
    notes_arr.each do |note|
      new_note = Note.create(content: note) 
      if new_note.valid?
        self.notes << new_note
      end
    end
  end

  def note_contents
    notes.collect {|note| note.content }
  end


end

