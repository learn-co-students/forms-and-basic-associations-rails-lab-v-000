class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  
  has_many :notes
  
   def artist_name=(name)
    self.artist =  Artist.find_or_create_by(name: name)
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

  def song_genre_id(id)
    Genre.find(id).name
  end

  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    return_array = Array.new
    self.notes.each do |note|
      return_array << note.content
    end
    return_array
  end
  
end
