require "rubygems"
require "active_record"

ActiveRecord::Base.establish_connection(
    adapter:  "sqlite3",
    host:     "localhost",
    database: "test.db"
    )

class Company < ActiveRecord::Base
end

c = Company.create(name: "テスト株式会社")


p c.name
