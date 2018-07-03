class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
  
  def note_contents=(notes)
    notes.each do |note|
      current_note = Note.find_or_create_by(content: note)
      if current_note
        self.notes << current_note
      end
    end
  end

  def note_contents
    @notes = Note.all
    @note_contents = []
    @notes.each do |name|
      if !name.content.empty?
        @note_contents << name.content
      end
    end
    @note_contents
  end

end

