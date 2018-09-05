class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    #self.try(:artist).try(:name)
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    #self.artist = artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    #self.genre = genre
  end

  def genre_name
    #self.try(:genre).try(:name)
    self.genre ? self.genre.name : nil
  end    
  
  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end



end
