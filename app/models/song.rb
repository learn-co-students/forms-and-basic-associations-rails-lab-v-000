class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #genre_name=
  #artist_name=
  #note_contents=

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist != nil ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre != nil ? self.genre.name : nil
  end

  def note_contents=(notes)
   notes.each do |content|
     if content.strip != ''
       self.notes.build(content: content)
     end
   end
 end

 def note_contents
   content = []
   self.notes.each do |note|
    content << note.content
   end
   content
 end
end
