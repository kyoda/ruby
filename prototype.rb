require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'psych'
require 'sqlite3'
require 'active_record'
require 'pdf/reader'
require "mail"

c = YAML.load_file("./parser.conf.yaml")

ActiveRecord::Base.establish_connection(
    adapter:  c['sql']['adapter'],
    host:     c['sql']['host'],
    database: c['sql']['database']
    )

class Company < ActiveRecord::Base
end




def mainProcess(c, time, code, name, pdf_url)

  io = open(pdf_url, "rb")
  reader = PDF::Reader.new(io)

  pdf = ""
  reader.pages.each do |page|
    pdf = page.text
  end


  Company.create(time: time, code: code, name: name, url: pdf_url, data: pdf)

  mail = Mail.new do

    from    c['mail']['to'][0]
    to      c['mail']['to'][1]
    cc      c['mail']['to'][2]
    subject name + "(" + code + ")" + c['search_word'][0]
    body    pdf
    charset = "UTF-8"

  end

  mail.delivery_method(:smtp,
      address:        c['mail']['host'], 
      port:           25,
      )
  mail.deliver

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


  if l.css('td')[3].content.include?(c['search_word'][0]) then

    time = l.css('td')[0].content.strip
    code = l.css('td')[1].content.strip
    name = l.css('td')[2].content.strip
    pdf_url = c['pre_url'] + l.css('td a').attribute('href').value

    p time + ": " + name + ": " + l.css('td')[3].content.strip
    com = Company.where(day: Date::today.to_s)

    if com.empty? then

      p "insert..."
      mainProcess(c, time, code, name, pdf_url)
      p "finish"

    else

      com.each do |c| 

        if ! c['name'].include?(name) then

          p "insert..."
          mainProcess(c, time, code, name, pdf_url)
          p "finish"

        else 
          p "Already there"
        end

      end

    end

  else
    #p "Nothing..."
  end

end


