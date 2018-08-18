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



def note_contents=(contents)
  contents.each do |content|
    if content != ""
      self.notes.build(content: content) #it's an association method between song and notes.
    end
  end
end

def note_contents
  arr = []
  self.notes.each do |note|
    arr << note.content
  end
  arr
end


end
