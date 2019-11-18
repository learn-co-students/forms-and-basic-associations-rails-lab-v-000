class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def artist_name
      self.artist ? self.artist.name : nil
   end

   def genre_name=(name)
      self.genre = Genre.find_by(name: name)
    end

    def genre_name
       self.genre ? self.genre.name : nil
    end

    def note_contents=(contents)
      # if contents not empty, create note with content and song id
      # push note to song's notes
      contents.each do |content|
        if !content.empty?
          note = Note.create(content: content, song_id: self.id)
          self.notes << note
        end
      end

    end

    def note_contents
      self.notes.collect { |note| note.contents}
    end
end
