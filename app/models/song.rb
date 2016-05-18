class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
   self.try(:artist).try(:name)

  end



  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(note_array)
    
   
    note_array.each do |note|
    unless note == ""
      note = self.notes.new(content: note)
   
    end
    end



  end

  def note_contents
  
    notes.collect {|x| x.content}

  end



end

