require "process"

module QRReader
  # Membaca QR code dari gambar atau PDF menggunakan zbarimg dan pdfimages
  def self.read(file_path : String) : String?
    if file_path.ends_with?(".pdf")
      return read_from_pdf(file_path)
    else
      return read_from_image(file_path)
    end
  end

  private def self.read_from_pdf(pdf_path : String) : String?
    image_output = "./temp_qr_image"

    # Ekstrak gambar dari PDF menggunakan pdfimages (pastikan pdfimages sudah terinstal)
    system("pdfimages -j #{pdf_path} #{image_output}")

    qr_results = [] of String

    # Coba membaca semua gambar yang diekstrak
    Dir.glob("#{image_output}*.*").each do |image_path|
      qr_code = read_from_image(image_path)
      qr_results << qr_code if qr_code
    end

    # Hapus gambar sementara
    Dir.glob("#{image_output}*.*").each { |file| File.delete(file) }

    qr_results.empty? ? nil : qr_results.first
  end

  private def self.read_from_image(image_path : String) : String?
    output = IO::Memory.new
    error = IO::Memory.new

    # Jalankan perintah zbarimg
    status = Process.run("zbarimg", args: ["--quiet", "--raw", image_path], output: output, error: error)

    return output.to_s.strip if status.success?

    STDERR.puts "Error: #{error.to_s.strip}" if error.to_s.strip != ""
    nil
  end
end
