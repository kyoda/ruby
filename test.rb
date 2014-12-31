class Aaaa

  @@str = "aiueo"
  @@count = 0

  def getStr
    @@count += 1;
    return @@str
  end

  def getCount
    @@count
  end

end

a = Aaaa.new();
c = "auaua"

for i in 1..10 do
  #p c 
  p a.getStr()
end


p a.getCount()

p 33.123456789.to_i



