class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
    # self.try(:genre).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
    # self.try(:artist).try(:name)
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes << Note.find_or_create_by(content: content) unless content.empty?
    end
  end

  # def note_contents=(notes)
  # notes.each do |content|
  #   if content.strip != ''
  #     self.notes.build(content: content)
  #     end 
  #   end
  # end

  def note_contents
    self.notes.map{|note| note.content }
    # self.notes.map(&:content) -- passing a block
  end
end
