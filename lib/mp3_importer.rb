require 'pry'

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*"].reduce([]) { |files, file| files << file.split("#{@path}/")[1] }
  end

  def import
    self.files.each { |song_name| Song.new_by_filename(song_name) }
  end
end