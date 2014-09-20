require 'date'

p Date::today.to_s

a = Array[Date::today.to_s, "testCompany", "dame"]
a.each do |b|
  p b
end
