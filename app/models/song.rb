class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name) ## instead of @song.artist.name if @song && @song.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name) ## instead of @song.genre.name if @song && @song.genre
  end

  def note_contents=(notes)
    notes.each do |content|
    #  if content.strip != ""
        self.notes << Note.find_or_create_by(content: content) unless content == ""
    #  end
    end
  end

  def note_contents
    self.notes.collect { |n| n.content }
  end
end
