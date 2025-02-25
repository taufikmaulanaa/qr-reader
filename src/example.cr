require "./qr-reader"

# Path to the image containing the QR code
image_path = "./src/qr-code.png"

# Read the QR code
if qr_content = QRReader.read(image_path)
  puts "QR Code Content: #{qr_content}"
else
  puts "Failed to read QR code from the image."
end
