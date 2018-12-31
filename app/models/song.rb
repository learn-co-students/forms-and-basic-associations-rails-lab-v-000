class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre=Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name if self.genre
  end  

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name: name)
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ""
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    ar=[]
    self.notes.each do |note|
      ar << note.content unless note.content.empty?
    end
    ar
    
  end

end
