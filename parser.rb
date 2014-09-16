require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'psych'
require 'sqlite3'

db = SQLite3::Database.new("test.db")
sql =<<EOM
  CREATE TABLE company(
    id integer,
    name varchar(10)
  );
EOM


# irb

#conf = YAML.load_file("./parser.conf.yaml")
#url = conf['url']
#p conf['search_word'][0]
#p conf['search_word'][1]

charset = nil
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


