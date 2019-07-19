class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #custom getters and setters
  
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



  def note_contents=(contents) #custom setter that checks if string is blank in array
    contents.each do |content|
      if content.strip != "" 
      note = Note.find_or_create_by(content: content)
      self.notes << note
      end
    end
  end

  def note_contents #and getter is needed 
    note_contents_array = []
    self.notes.each do |note| 
      note_contents_array << note.content
    end 
    note_contents_array
  end

  

end
