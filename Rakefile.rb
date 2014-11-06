# require './playlist.rb'
# task :default => [:test]

# task :test1 do
#  ruby "playlist.rb 542456b0acb0470200000010"
# end

# task :test2 do
#   ruby "playlist.rb 5455c475650ac50200000002"
# end

task :playlistCI do
  plid = ENV["playlistid"]
  ruby "plist.rb #{plid}"
end
