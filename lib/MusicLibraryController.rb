class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    input = gets.chomp
    
    if input != "exit"
      call
    end
    
    case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        
      when 'list artist'
        
      when 'list genre'
        
      when 'play song'
        
    end
  end
  
  def list_songs
    Song.all.sort { |x, y| x.name <=> y.name }.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort { |x, y| x.name <=> y.name }.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    Genres.all.sort { |x, y| x.name <=> y.name }.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
  
  #def list_songs_by_artist
  #  Artist.all.sort { |x, y| x.name <=> y.name }.each_with_index do |artist, index|
  #    puts "#{index + 1}. #{artist.name}"
  #  end
  #end
end