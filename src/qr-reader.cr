require "process"

module QRReader
  # Membaca QR code dari gambar menggunakan zbarimg
  def self.read(image_path : String) : String?
    output = IO::Memory.new
    error = IO::Memory.new

    # Jalankan perintah zbarimg
    status = Process.run("zbarimg", args: ["--quiet", "--raw", image_path], output: output, error: error)

    if status.success?
      # Kembalikan konten QR code
      output.to_s.strip
    else
      # Jika gagal, kembalikan nil dan cetak error (opsional)
      STDERR.puts "Error: #{error.to_s.strip}" if error.to_s.strip != ""
      nil
    end
  end
end
