class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :genre_name

require 'pry'


  def genre_name=(name) 
  	self.genre = Genre.find_or_create_by(name: name) 
  end 


   def genre_name
   	self.genre.name
   end

   def artist_name=(name)
   	self.artist = Artist.find_or_create_by(name: name) 
   end  

   def artist_name 
    self.try(:artist).try(:name) 
   end

   def note_contents 
   	self.notes.map {|n| n.content} 
   end 

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end





  # describe 'note_contents=' do
  #   it 'sets notes for a song' do
  #     song = Song.new
  #     notes = ['Great song', 'much bass', 'wow']
  #     song.note_contents = notes
  #     expect(song.notes.map(&:content)).to eq notes
  #   end




  # describe 'note_contents' do
  #   it 'returns the content of all notes as an array' do
  #     song = Song.new
  #     song.note_contents = ['hi', 'there']
  #     expect(song.note_contents).to eq ['hi', 'there']
  #   end
  # end



end

 