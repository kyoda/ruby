class Aaaa

  @@str = "aiueo"
  @@count = 0
  @@name = "yamada"

  def getStr
    @@count += 1;
    return @@str
  end

  def getCount
    @@count
  end

  def name
    @@name
  end

end

a = Aaaa.new();

for i in 1..10 do
  p a.getStr()
  p a.getCount()
  p a.name
end

puts "###################################################################################"


def a.id
  55
end
puts a.id

puts "###################################################################################"
class Bbbb < Aaaa

  @@data = {}

  def initialize
    @@name = "aaaaaaa"
    @@data[:bbb] = nil;
    puts "initialize..."
    p @@data[:aaa].to_f * 3
  end

  def getName
    @@name
  end

end 

puts "Bbbb class"
b = Bbbb.new()
p b.getName
p b.getCount

puts "###################################################################################"


#puts "aiu".methods.sort

puts 33.123456789.to_i
puts '33'.to_f
puts 'aiueo'[2]

e = nil 
puts 3 * e.to_i.to_i;
p "1,234,567".delete(',').to_i


{a: "aiueo", b: "kakikukeko"}.each do |n|
  p n
  puts n
end

