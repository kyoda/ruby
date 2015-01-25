
p [1, 2, 3, 4, 5, 6].map{|x| x * x}
p [1, 2, 3, 4, 5, 6].collect{|x| x ** x}

h = {aa: 3, bb: 4}
p h.map{|x| x * 2}

p [{name: "taro", age: 8}, {name: "jiro", age: 7}].map{|x| x[:age] * 2}

for i in 2007..2015 do
  p i
end

