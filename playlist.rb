#!/usr/bin/env ruby
require 'qacloud'

playlistID = ARGV[0]
puts playlistID
# tokenID = "oChbNdoggDrVhIv/dL5cXkkUMflCASw3K/R2tUyyVa3HW1njpNOv3sXRElPxaj58"
tokenID = "dW8MbiB1o7ezufY9xJNtRvTe5iISaoqotcS/AOl+thyeNFje+RglWZRuLA7FFzTi"
# tokenID = "0/Hxy85jkc9ZgSWAmwPFE/kLD60MBwwI6gDmGTHbGNBqt9sOehujaoZA62zccR0r"
playlist(playlistID,tokenID)
