require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'psych'
require 'sqlite3'
require 'active_record'

c = YAML.load_file("./parser.conf.yaml")

ActiveRecord::Base.establish_connection(
    adapter:  c['sql']['adapter'],
    host:     c['sql']['host'],
    database: c['sql']['database']
    )

class Company < ActiveRecord::Base
end



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

doc.xpath('//table/tbody/tr').each do |l|

  if l.css('td')[3].content.index(c['search_word'][0]) then

    time = l.css('td')[0].content
    p time
    code = l.css('td')[1].content
    p code
    name = l.css('td')[2].content
    p name
    pdf = c['pre_url'] + l.css('td a').attribute('href').value
    p pdf

    Company.create(time: time, code: code, name: name, data: pdf)

  end
end

