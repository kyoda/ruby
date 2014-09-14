require 'pdf/reader'

File.open("./tmp/test.pdf", "rb") do |io|

  reader = PDF::Reader.new(io)

  puts reader.pdf_version
  puts reader.info
  puts reader.page_count

  reader.pages.each do |page|
    puts page.text
    break
  end

end

