require "qacloud"
task :playlistCI do
  plid = ENV["playlistid"]
  ruby "playlist.rb #{plid}"
end
