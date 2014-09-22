require 'sqlite3'
require 'yaml'
require 'active_record'
require 'date'
require 'pdf/reader'

c = YAML.load_file("./parser.conf.yaml")

ActiveRecord::Base.establish_connection(
    adapter:  c['sql']['adapter'],
    host:     c['sql']['host'],
    database: c['sql']['database']
    )

class Company < ActiveRecord::Base
end

pdf_url = c['pdf_url'][0]

io = open(pdf_url)
reader = PDF::Reader.new(io)
pdf = reader.pages.text

puts pdf

