require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
     self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def note_contents=(arry)
    # Better implementation below.   Note- neither seems to
    # remove old notes.
    # it doesn't remove old notes (that are not in new array)
    # arry.delete_if(&:blank?).each { |c|
    #   if !Note.find_by(content: c, song_id: self.id)
    #     n = Note.new(:content => c, :song_id => self.id)
    #     self.notes << n
    #   end
    # }
    arry.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end
  def note_contents
  #  self.notes.map { |note| note.content}  more concise below
    self.notes.map(&:content)
  end
end
