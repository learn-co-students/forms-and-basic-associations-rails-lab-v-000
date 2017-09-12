class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    artist.name unless artist.nil?
  end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def new_notes=(contents)
    #binding.pry
    contents.each do |content|
      if content != ""
        note = Note.create(content: content, song_id: self.id)
        notes << note
      end

    end
  end

  def note_contents
    notes.collect {|n| n.content}
  end
end
