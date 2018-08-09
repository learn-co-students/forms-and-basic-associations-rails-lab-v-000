class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  self.artist_name = Artist.find_or_create_by(name: name)
end

def category_name
   self.artist ? self.artist.name : nil
end

def genre_name=(name)
self.genre_name = Genre.find_or_create_by(name: name)
end

def genre_name
 self.genre ? self.genre.name : nil
end

def note_contents=(content)
self.note_contents = Note.find_or_create_by(content: content)
end

def note_contents
 self.note ? self.note.content : nil
end


end
