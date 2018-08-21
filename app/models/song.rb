
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
    genre ? genre.name : nil
  end
  
  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    artist ? artist.name : nil
  end
  
  def note_contents=(content)
    content.each do |content|
      content = Note.find_or_create_by(content: content)
    end
  end
  
  def note_contents
    if note
      note.content.collect { |content| }
    end
  end
  
end

