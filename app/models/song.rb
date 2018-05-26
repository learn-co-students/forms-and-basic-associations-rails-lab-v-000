class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre      
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist      
  end

  def note_contents=(the_notes)
    the_notes.each do |ind_note|
      if ind_note.strip != ''
        self.notes.build(content: ind_note)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end

  # def artist_name
  #   self.try(:artist).try(:name)
  # end

  # try is better because could end up with lots of if statements?? really? 
  #Matt Cassara
  
  # def artist_name=(name)
  #   artist = Artist.find_or_create_by(name: name)
  #   self.artist = artist
  # end


