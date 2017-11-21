class Song < ActiveRecord::Base
  belongs_to :artist # a song instance belongs to an artist instance
  belongs_to :genre
  has_many :notes
# custom setter #artist_name=(name) is called whenever a song instance is initialized w/ artist_name field (for artist_name attribute)
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
    # above code is the same as:
    # if self.artist
    #  self.artist.name
    # end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(notes) # notes argument is an array of strings, and each string is possible content attribute value of a note instance
    notes.each do |content|
      if !content.empty?
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
    # above code is same as saying
    # self.notes.map {|note| note.content}
  end
end
