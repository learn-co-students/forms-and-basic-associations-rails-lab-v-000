class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

# HOW IS THE GENRE ID VALUE BEING ATTACHED TO THE GENRE NAME?

# HOW DOES .TRY WORK?

  def genre_name
    self.try(:genre).try(:name)
  end 

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  # def notes_content(content)
  #   self.try(:note).try(:content)
  # end

  def notes_content(content)
     content.each do |id|
       note = Note.find_or_create_by(content: content)
       self.notes << note
     end
  end



end

