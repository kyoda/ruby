
p [1, 2, 3, 4, 5, 6].map{|x| x * x}
p [1, 2, 3, 4, 5, 6].collect{|x| x ** x}

h = {aa: 3, bb: 4}
p h.map{|x| x * 2} # hash => array ?

user = [{name: "taro", age: 8}, {name: "jiro", age: 7}]
p user.map!{|x| x[:age] * 2}
p user
p [[1, 2], [3, 4]].map{|x| x * 2}
p [5, 6] * 2

hh = {cc: 3}
p hh
aa = [8, hh]
p aa * 3

for i in 2007..2015 do
  p i
end

