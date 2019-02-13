class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
     self.artist = artist.find_or_create_by(name: name)
   end

   def artist_name
      self.artist ? self.artist.name : nil
   end

   def genre=(name)
      self.genre = genre.find_or_create_by(name: name)
    end

    def genre
       self.genre ? self.genre.name : nil
    end
end
