class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
    
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
    
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(note_contents)
      note_contents.each do |note_content| 
        if note_content.strip != ""
          self.notes.build(content: note_content)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end

