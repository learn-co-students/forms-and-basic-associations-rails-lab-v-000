class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  def artist_name
    self.artist.name if self.artist !=nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  def genre_name
    self.genre.name if self.genre !=nil
  end

  def genre_name=(name)
   self.genre = Genre.find_or_create_by(name: name)
   #binding.pry
  end
  def note_contents
    self.notes.map do |note| #map to return a new collection of notes content
      note.content
    end
  end

  def note_contents=(notes)#notes argument value is from
    #new.html.erb's Song notes_content
    #binding.pry
   notes.each do |content|
      self.notes.build(content: content) if content != ""
      #build provides associations and push into collection
   end#binding.pry
  end
  def note_ids
    self.note.content
  end

  def note_ids=(ids)
  ids.each do |id|
    note = Note.find(id)
    self.notes << note
  end
end
end
