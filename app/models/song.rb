class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many   :notes

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

# some method will iterate iover the params from the song,.new page, grab the notesand
# instantiate them as new notes and associate to the song
# the params will have a notes array and when you pass those to the strong params it will call this method
  # binding.pry
  # notes = ["note1", "note2"]


  def note_contents=(note_array)
    # binding.pry
    note_array.each do |note|
      self.notes.build(content: note) if !note.empty?
   end
  end


  def note_contents
    # binding.pry
    self.notes.collect do |note|
      # binding.pry
      note.content
    end
  end



  # def genre_name=(genre)
  #   self.genre = Genre.find_or_create_by(name: name)
  # end
  #
  # def genre_name
  #   self.genre ? self.genre.name : nil
  # end



end
