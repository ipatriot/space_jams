class Albums

  def initialize(album_id, album_name, title, artists, duration_ms)
    @album_id = album_id
    @album_name = album_name
    @title = title
    @artists = artists
    @duration_ms = duration_ms
  end

  def id_album
    return @id_album
  end

  def title
    return @album_name
  end

  def artist
    return @artists
  end

  def tracks
    @tracks = []
    @tracks.push({"title" => @title, "album ID" => @album_id, "Album name" => @album_name,"Artists" => @artists})
  end

  def duration_min
  end

  def summary
    puts "Name: " + @title
    puts "Artist: " + @artist
  end
end

require 'space_jams.csv'
require_relative 'album'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  album = albums.find { |a| a.id == track[:album_id] }

  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists])
    albums << album
  end

  # add the track to the album's @tracks instance variable
  album.tracks << track
end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
