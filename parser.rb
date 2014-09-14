require 'rubygems'
require 'nokogiri'
require 'open-uri'

# irb

charset = nil
url = ""

ARGV.each do |arg|
  url = arg
end


html = open(url) do |f|
  charset = f.charset 
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)


# frame
frame_url = File.dirname(url) + "/" + doc.css('frame')[1]['src']


html = open(frame_url) do |f|
  charset = f.charset 
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.css('td.evennew000 a').each do |link|

  p link.content
  p link['href']

end


