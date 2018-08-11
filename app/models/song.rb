class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
 def artist_name= (name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist == nil
      ""
    else
      self.artist.name
    end
  end

  # def artist_name
  #   self.artist.name ||= ""
  # end

  def genre_name= (name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre == nil
      ""
    else
      self.genre.name
    end
  end

  def note_contents= (contents)
    if contents == []
      return
    end

    contents.each do |content|
      if content != ""
        new_note = Note.new(content: content)
        self.notes << new_note
      end
    end
  end

  def note_contents
    if self.notes == nil
      []
    else
      self.notes.collect do |note|
        note.content
      end
    end
  end

end