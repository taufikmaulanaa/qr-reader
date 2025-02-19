# QR Reader Library for Crystal

A Crystal library to read QR codes from images using the `zbarimg` command-line tool.

## Installation

### Step 1: Install Dependencies

Before using the library, ensure that `zbar-tools` is installed on your system. You can install it using the following commands:

- **Ubuntu/Debian**:
  ```bash
  sudo apt install zbar-tools
  ```

- **macOS** (using Homebrew):
  ```bash
  brew install zbar
  ```

- **Windows** (using Homebrew):
Download and install ZBar from [ZBar's ZBar's official website](https://zbar.sourceforge.net/)

### Step 2: Add the Library to Your Project

Add the qr-reader library to your `shard.yml` file:

   ```yaml
   dependencies:
     qr-reader:
       github: taufikmaulanaa/qr-reader
   ```

Then, install the dependency by running:

Run `shards install`

## Usage

### Step 1 : Import the Library

In your Crystal application, require the `qr-reader` library:

```crystal
require "qr-reader"
```

### Step 2 : Import the Library

Use the `QRReader.read` method to extract the content of a QR code from an image file.

Example : 
```crystal
require "qr-reader"

# Path to the image containing the QR code
image_path = "path/to/your/image.png"

# Read the QR code
if qr_content = QRReader.read(image_path)
  puts "QR Code Content: #{qr_content}"
else
  puts "Failed to read QR code from the image."
end
```

## Contributing

1. Fork it (<https://github.com/taufikmaulanaa/qr-reader/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Taufik](https://github.com/taufikmaulanaa) - creator and maintainer
