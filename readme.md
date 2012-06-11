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

##Usage
    $ ruby jsontag.rb
    > Location of JSON file to read from:
    -> sample.json
    > Location of audio file to save to:
    -> sample.mp3