### Depends on: ###
#    taglib:			http://developer.kde.org/~wheeler/taglib.html `brew install taglib`
#    taglib-ruby: http://robinst.github.com/taglib-ruby/				`gem install taglib-ruby`
#    json:				http://flori.github.com/json/									`get install json`

require 'rubygems'
require 'taglib'
require 'json'

#Load attributes from file
attributes = JSON.parse( File.open('sample.json').read )

#Open file
TagLib::MPEG::File.open("sample copy.mp3") do |file|
	tag = file.id3v2_tag(true)

	# Set attributes
	 tag.title = attributes['title']
	tag.artist = attributes['artist']
	 tag.album = attributes['album']
	  tag.year = attributes['year']
	 tag.track = attributes['track_number']
	 tag.genre = attributes['genre']
	 
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