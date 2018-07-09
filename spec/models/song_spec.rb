require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'genre_name=' do
    it 'sets the genre to the genre of the specified name' do
      song = Song.new
      song.genre_name = 'Rock'
      expect(song.genre.name).to eq 'Rock'
    end
  end

  describe 'genre_name' do
    it 'returns the genre name' do
      song = Song.new
      song.genre_name = 'Rock'
      expect(song.genre_name).to eq 'Rock'
    end
  end

  describe 'artist_name=' do
    it 'sets the artist to the artist of the specified name' do
      song = Song.new
      song.artist_name = 'Rock Hudson'
      expect(song.artist.name).to eq 'Rock Hudson'
    end
  end

  describe 'artist_name' do
    it 'returns the artist name' do
      song = Song.new
      song.artist_name = 'Rock Hudson'
      expect(song.artist_name).to eq 'Rock Hudson'
    end
  end

  
end
