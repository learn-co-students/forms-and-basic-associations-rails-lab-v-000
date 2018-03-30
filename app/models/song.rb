class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name

    self.artist.name if self.artist
  end

  def note_contents=(content)
    if !content.empty?
      content.each do |words|
        if !words.empty?
          self.notes << Note.create(content: words)
        end
      end
    end
  end

  def note_contents
    if self.notes
      @array = []
      self.notes.each do |note|
        @array << note.content
      end
    end
    @array
  end


end
