lines = File.open('input03.txt').read
ans = 0

def solve(line, i, len, mem)
  return 0 if (i == line.length) && (len == 12)
  return -10**12 if i == line.length

  key = "#{i}-#{len}"
  return mem[key] if mem.key?(key)

  ans = solve(line, i + 1, len, mem)
  ans = [ans, 10**(11 - len)*line[i].to_i + solve(line, i + 1, len + 1, mem)].max if len < 12

  mem[key] = ans
  ans
end

lines.each_line do |line|
  ans += solve(line.chomp, 0, 0, {})
end

puts ans
