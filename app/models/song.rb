class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

   def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist_id = artist.id
    self.save
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre_id = genre.id
    self.save
  end

  def note_contents=(contents)
      contents.each do |content|
        if content.strip != ''
          self.notes.build(content: content)
        end
      end
  end

  def note_contents
    self.notes.map(&:content)
  end

  
end

