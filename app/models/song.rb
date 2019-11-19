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
    # don't need setter/getter with accepts_nested_attributes_for :notes
    # can make custom setter
    def notes_attributes=(notes_hashes)
      notes_hashes.values.each do |note_attributes|
        # DO NOT CREATE A NOTE IF IT DOESN'T HAVE CONTENT
        if note_attributes[:content].present?
          note = Note.find_or_create_by(content: note_attributes[:content])
          # DON'T ADD A NOTE  TO A SONG IF IT ALREADY HAS IT
          if !self.notes.include?(note)
            self.notes << note
          end
        end
      end
    end
=begin
    def note_contents
      self.notes.collect { |note| note.contents}
    end
=end
end
