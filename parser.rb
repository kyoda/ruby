require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'psych'
require 'sqlite3'
require 'active_record'


# irb

c = YAML.load_file("./parser.conf.yaml")

charset = nil
html = open(c['url']) do |f|
  charset = f.charset 
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)


# frame
frame_url = File.dirname(c['url']) + "/" + doc.css('frame')[1]['src']


html = open(frame_url) do |f|
  charset = f.charset 
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
#doc.css('td.evennew000 a').each do |l|
doc.css('tr').each do |l|

  l.css('td')[0].content
  l.css('td')[1].content
  l.css('td')[2].content
  l.css('td a').attribute('href').value
  l.css('td')[3].content

end

