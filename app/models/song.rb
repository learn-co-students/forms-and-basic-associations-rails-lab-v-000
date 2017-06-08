class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    else
      nil
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      nil
    end
  end

  def note_contents=(content)
    content.each do |c|
      if !c.empty?
        self.notes << Note.find_or_create_by(content: c)
      end
    end
  end

  # def notes=(ids)
  #   ids.each do |id|
  #       self.notes << Note.find(id)
  #     end
  #   end

  def note_contents
    self.notes.collect {|n| n.content}
  end
end
