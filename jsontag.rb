### Depends on: ###
#    taglib:			http://developer.kde.org/~wheeler/taglib.html `brew install taglib`
#    taglib-ruby: http://robinst.github.com/taglib-ruby/				`gem install taglib-ruby`
#    json:				http://flori.github.com/json/									`get install json`

require 'rubygems'
require 'taglib'
require 'json'

#Get file paths from user
puts "Location of JSON file to read from: "
json_path = gets.chomp
puts "Location of audio file to save to: "
audio_path = gets.chomp


#Load attributes from file
attributes = JSON.parse( File.open(json_path).read )

#Open file
TagLib::MPEG::File.open(audio_path) do |file|
	tag = file.id3v2_tag(true)

	# Set attributes
	if attributes['title'] 				then  tag.title = attributes['title']				 end
	if attributes['artist'] 			then tag.artist = attributes['artist']			 end
	if attributes['album'] 				then  tag.album = attributes['album']				 end
	if attributes['year'] 				then   tag.year = attributes['year']				 end
	if attributes['track_number'] then  tag.track = attributes['track_number'] end
	if attributes['genre'] 				then  tag.genre = attributes['genre']				 end
	 
	 #Add artwork
	 if attributes['artwork']
		 artframe = TagLib::ID3v2::AttachedPictureFrame.new
		 artframe.mime_type = "image/png"
		 artframe.description = "Cover"
		 artframe.type = TagLib::ID3v2::AttachedPictureFrame::FrontCover
		 artframe.picture = File.open(attributes['artwork'], 'rb') { |f| f.read }
		 tag.add_frame(artframe)
	 end

	#Save file
	file.save
end