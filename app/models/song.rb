class Song < ActiveRecord::Base
  attr_accessor :artist_name, :genre_name
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    @artist_name = self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    @genre_name = self.genre.name
  end

  def note_contents=(notes)
    notes.each do |content|
      if content !=nil
        if !content.empty?
          self.notes.build(content: content)
        end
      end
    end   
  end

  def note_contents
    self.notes.map(&:content)
  end
end

