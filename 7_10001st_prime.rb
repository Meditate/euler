a = []
n = 3
while a.size < 10000
  flag = true
  for i in 2..n/2 do
    if n % i == 0
      flag = false
      break
    end
  end
  a << n if flag
  n += 1
end
puts a

# => 104743

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10 001st prime number?
