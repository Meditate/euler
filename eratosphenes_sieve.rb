class Sieve
  def self.primes(max)
    primes = [1] * max

    primes[0] = nil
    primes[1] = 0

    (2..max).to_a.each do |num|
      break if num*num > max

      (num*num).step(max, num) { |not_prime| primes[not_prime] = 0 }
    end

    puts primes
  end
end

Sieve.primes(1000000)
