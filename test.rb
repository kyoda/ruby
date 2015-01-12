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
c = "auaua"

for i in 1..10 do
  #p c 
  p a.getStr()
end


p a.getCount()

puts 33.123456789.to_i
puts '33'.to_f
puts 'aiueo'[2]

{a: "aiueo", b: "kakikukeko"}.each do |n|
  p n
  puts "#####################"
  puts n
end

p a.name

def a.id
  55
end
puts a.id

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

b = Bbbb.new()
p b.getName

e = nil 
puts 3 * e.to_i;
p "1,234".delete(',').to_i

#puts "aiu".methods.sort

