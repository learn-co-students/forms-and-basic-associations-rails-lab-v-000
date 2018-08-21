require "pry"
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name) #setter
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name # getters... We cant use attr-accesor here.
      self.artist ? self.artist.name : nil
  end


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
      self.genre ? self.genre.name : nil
  end

   def note_contents= (notes) #this is the setter..
     notes.each do |note|
      if note.strip != "" # checking thats it not empty.
       self.notes.build(:content => note) # build assoicate the note with the song. 
      end
     end
   end

   def note_contents  #this is the getter... 
     # we are looping her..
     self.notes.collect {|note| note.content} #targeting one attribute in the note.
   end
  


end

