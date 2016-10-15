class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

   def note_contents
     self.notes.map { |note| note.content }
   end

  def note_contents=(notes)
    notes.each do |content|
      if !content.empty? 
        note = Note.create(content: content)
        self.notes << note 
      end
    end
  end


   def genre_name
    self.try(:genre).try(:name)
  end    

  def artist_name
    self.try(:artist).try(:name)
  end


end

