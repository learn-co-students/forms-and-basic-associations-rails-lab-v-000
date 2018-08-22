
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
    self.genre ? self.genre.name : nil
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
  end
  
<<<<<<< HEAD
  def note_contents=(notes)
    notes.each do |content|
      self.notes << Note.find_or_create_by(content: content) unless content.strip.empty?
=======
  def note_contents=(contents)
binding.pry
    contents.each do |content|
binding.pry
      self.notes = Note.find_or_create_by(content: content)
>>>>>>> 4391c05e6882b35650b1526c080210df95aa37ee
    end
  end
  
  def note_contents
binding.pry
    if self.notes
<<<<<<< HEAD
      self.notes.collect { |note| note.content unless note.content.to_s.strip.empty? }.compact
=======
      self.notes.content.collect { |content| 
        binding.pry
      }
>>>>>>> 4391c05e6882b35650b1526c080210df95aa37ee
    end
  end
  
end

