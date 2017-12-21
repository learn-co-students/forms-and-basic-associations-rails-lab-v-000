class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      return self.artist.name
    else
      return "none"
    end
  end

  def note_contents
    notes_array = []
    # Song.notes.all.each do |note|
    #   notes_array << note.content
    # end
    # notes_array
    #
    self.notes.each do |note|
      notes_array << note.content
    end
    notes_array
  end

  def note_contents=(notes_array)
    notes_array.each do |note|
      if !note.empty?
        self.notes << Note.create(content: note)
      end
    end
  end


end
