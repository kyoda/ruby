require 'sqlite3'
require 'yaml'
require 'active_record'
require 'date'

c = YAML.load_file("./parser.conf.yaml")

ActiveRecord::Base.establish_connection(
    adapter:  c['sql']['adapter'],
    host:     c['sql']['host'],
    database: c['sql']['database']
    )

class Company < ActiveRecord::Base
end


com = Company.where(day: "2014-09-18")
com.each do |b|
  p b.day
end
