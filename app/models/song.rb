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
    arry.each { |n|
      if !Note.find_by(content: n, song_id: self.id)
        binding.pry
        self.note_ids << Note.create(:content => n, :song_id => self.id)
      end
    }
    self.save
    binding.pry
  end
  def note_contents
    self.note_ids.map { |id| Note.find(id).content}
  end
end
