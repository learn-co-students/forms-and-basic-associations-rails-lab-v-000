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

    def genre_id=(id)
        self.genre = Genre.find_or_create_by(id: id)
    end 

    def song_notes=(notes)
      # binding.pry
      notes.each do |note|
        if note != ""  
          self.notes.build(content: note) 
        end 
      end 
    end 
end
