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


  def song_genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def song_genre_id
     self.genre ? self.genre.name : nil
  end

  def note_contents=(song_notes)
    # binding.pry
    song_notes.each do |note|
      unless note == ''
        song_note = self.notes.build(content: note)
        binding.pry
        song_note.save
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end


end
