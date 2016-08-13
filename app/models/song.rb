class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def song_artist_name
    self.artist.name if artist
  end


  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if artist
  end


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def genre_name
    self.genre.name if genre
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.genre_name
  end

  def note_contents
    content_array = []
    self.notes.each do |note|
      content_array << note.content
    end
    content_array
  end

  def note_contents=(content)
    content.each do |note|
      note = note.strip!
      if !(self.notes.include?(note)) && !(note.nil?) && note != ""
        new_note = Note.create(content: note)
        self.notes << new_note
      end
    end
    self.note_contents
  end
end

