require 'rubygems'
require 'nokogiri'
require 'open-uri'

# irb

url = 'http://yahoo.co.jp'
charset = nil

html = open(url) do |f|
  charset = f.charset 
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

p doc.title

