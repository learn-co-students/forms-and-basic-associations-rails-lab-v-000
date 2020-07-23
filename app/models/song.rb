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

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes_contents=(contents)
    contents.each do |x|
      if x != ""
        note = Note.create(content: x, song_id: self.id)
        self.notes << note
      end 
    end 
  end 

end
