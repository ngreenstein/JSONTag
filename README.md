#JSONTag

##Description
Writes properties from a given JSON file into the ID3 tags of a given audio file

##Supported Properties
* Title (string)
* Artist (string)
* Album (string)
* Year (int)
* Track Number (int)
* Genre (string)
* Artwork (string) (path to PNG file)

##Depenencies
* **[taglib](http://developer.kde.org/~wheeler/taglib.html)**    
`brew install taglib`
* **[taglib-ruby](http://robinst.github.com/taglib-ruby/)**   
`gem install taglib-ruby`
* **[json](http://flori.github.com/json/)**  
`gem install json`

##Usage

###Command-line arguments:
	$ ruby jsontag.rb jsonfile.json audiofile.mp3
###Interactice:
	$ ruby jsontag.rb
	> Location of JSON file to read from:
	-> sample.json
	> Location of audio file to save to:
	-> sample.mp3