class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def song_title=(title)
    self.title = Song.find_or_create_by(title: title) 
  end 

  def song_title 
    self.title
  end 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name 
    self.artist ? self.artist.name: nil
  end 

  def genre_name=(name)
      genre1 = Genre.find_or_create_by(name: name)
      self.genre = genre1
  end 

  def genre_name 
    self.genre ? self.genre.name: nil
  end
 

  def note_contents=(contents)
      
      contents.each do |content|
          if content == ""
          else 
            note = Note.find_or_create_by(content: content)
            self.notes << note 
            self.save
          end 
      end 
  end 

  def note_contents 
    @content_array = []
    self.notes.each do |content1|
      @content_array << content1.content
    end 
    @content_array
  end 
  
end

