class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  # def genre_id
  #   self.try(:genre).try(:id)
  # end

  def genre_id=(id)
    genre = Genre.find_or_create_by(id: id)
    self.genre = genre
  end

  def note_contents
    self.notes.collect(&:content)
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre.name = name
  end
end

  

