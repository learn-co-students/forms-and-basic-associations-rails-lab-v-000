class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.nil? ? nil: self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(notes)
     notes.each do |note|
       unless note == "" || note == nil
         self.notes.build(content: note)
       end
     end
   end

   def note_contents
     self.notes.map {|n| n.content}
   end

end
