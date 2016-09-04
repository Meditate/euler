
a = 999
max = 0
while a > 100 do
  b = 999
  while b > 100 do
    val = a*b
    devided = val.to_s.chars.each_slice((val.to_s.length/2.0).ceil).map(&:join)
    if devided[0] == devided[1].reverse
      max = val if val > max
    end
    b -= 1
  end
  a -=1
end
puts max
