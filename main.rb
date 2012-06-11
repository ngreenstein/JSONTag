### Depends on: ###
#    taglib:			http://developer.kde.org/~wheeler/taglib.html `brew install taglib`
#    taglib-ruby: http://robinst.github.com/taglib-ruby/				`gem install taglib-ruby`

require 'rubygems'
require 'taglib'

#Define attributes
title = "Track Name Goes Here"
artist = "Artist Goes Here"
album = "Album Goes Here"
year = 2012
track_number = 1
genre = "Genre Goes Here"

#Open file
TagLib::MPEG::File.open("sample.mp3") do |file|
	tag = file.id3v2_tag(true)

	# Set attributes
	 tag.title = title
	tag.artist = artist
	 tag.album = album
	  tag.year = year
	 tag.track = track_number
	 tag.genre = genre
	 
	 #Add artwork
	 artframe = TagLib::ID3v2::AttachedPictureFrame.new
	 artframe.mime_type = "image/png"
	 artframe.description = "Cover"
	 artframe.type = TagLib::ID3v2::AttachedPictureFrame::FrontCover
	 artframe.picture = File.open("sample.png", 'rb') { |f| f.read }
	 
	 tag.add_frame(artframe)

	#Save file
	file.save
end