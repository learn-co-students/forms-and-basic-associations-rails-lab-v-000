class Song < ActiveRecord::Base
  validates :title, presence: true
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

   def note_contents=(note_contents)
     note_contents.collect do |content|
       if !content.empty?
         self.notes.build(content: content).save
       end
     end
   end

   def note_contents
     self.notes ? self.notes : nil
     self.notes.collect do |note|
       note.content
     end
   end

end
