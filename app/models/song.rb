class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  
  def artist_name
    @artist_name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    @genre_name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents=(notes)
    binding.pry
    notes.delete("")
    notes.each do |note|
        note =  Note.find_or_create_by(content: note)
        self.notes << note 
    end
   # contents.each do |content|
     # self.notes
   # self.notes.content = Note.find_or_create_by(content: content)
  end

  def note_contents
    @note_contents
  end
end

#so I need to create the setter and getter methods so that instead of calling the object of artist, I can just get the name. 

#allow a category_name field to be permitted in create which calls that method that automatically saves the category to the post and or creates the category. 
