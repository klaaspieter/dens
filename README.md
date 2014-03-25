# Dens

Moves different density assets to their respective Android resource directories.

## Installation

    $ gem install dens

## Usage

`dens [origin_directory] [resource_directory]`

Moves any file suffixed with a density into it's respective resource directory. For example
`image-hdpi.png` will be moved into `[resource_directory]/drawable-hdpi/image.png`. 
If the destination directory does not exist the image will be moved into the
regular drawable directory.

Image files must be have the .png extension and the density must be seperated
from the image name using a '-'. These image names work:

- image.png
- image-hdpi.png
- image-something.png (will be moved into the drawable directory unless your
  resource folder contains a drawable-something directory)

These image names won't work (as expected):

- image_hdpi.png
- image.jpg

This is a very early implementation. There will be
[issues](https://github.com/klaaspieter/dens/issues)!

## Contributing

1. Fork it ( http://github.com/klaaspieter/android-density/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
