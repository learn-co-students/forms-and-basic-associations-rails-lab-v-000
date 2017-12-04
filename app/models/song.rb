class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist.name if artist && artist.name
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name if genre
  end

  def note_contents=(note)
    note = note.reject{ |n| n.empty? }
     self.notes << note.collect do |n|
       Note.create(content: n)
    end
    self.save
  end

  def note_contents
     self.notes.all.collect do |c|
        c.content
      end
    
  end

end
