class Song < ActiveRecord::Base
  validates :note_contents, presence: true
  #Setter Genre Attribute
  def genre_name=(name)
   self.genre = Genre.find_or_create_by(name: name)
  end

  #Reader Genre Attribute
  def genre_name
   self.genre.name
  end

  #Setter Song Attribute
  def artist_name=(name)
   self.artist = Artist.find_or_create_by(name: name)
  end

  #Reader Song Attribute
  def artist_name
   self.artist.name
  end

  def note_contents=(contents)
    contents.each do |one_element_of_content|
      if !one_element_of_content.empty?
       self.notes.build(content: one_element_of_content)
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  belongs_to :artist
  belongs_to :genre
  has_many :notes
end
