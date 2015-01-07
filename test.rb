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

#puts "aiu".methods.sort

