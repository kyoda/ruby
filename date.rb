require 'sqlite3'
require 'yaml'
require 'active_record'
require 'date'
require 'pdf/reader'
require 'open-uri'

c = YAML.load_file("./parser.conf.yaml")

ActiveRecord::Base.establish_connection(
    adapter:  c['sql']['adapter'],
    host:     c['sql']['host'],
    database: c['sql']['database']
    )

class Company < ActiveRecord::Base
end

# some pdf can't be read

pdf_url = c['pdf_url'][0]

io = open(pdf_url)
reader = PDF::Reader.new(io)
puts reader.pdf_version
puts reader.info
#puts reader.metadata
#puts reader.page_count

#reader.pages.each do |p|
#  puts p.fonts
#  puts p.text
#  #puts p.raw_content
#end


