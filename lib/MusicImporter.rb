class MusicImporter
  def initialize(path)
    @path = path
  end 
  
  def path
    @path
  end
  
  def files
    Dir.entries(@path).select { |song| song.end_with?(".mp3") }
  end
  
  def import 
    self.files.each { |song| Song.create_from_filename(song) }
  end
end