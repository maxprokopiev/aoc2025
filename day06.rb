lines = File.open("input06.txt").read
n = []; o = []; lines.each_line { |l| n << l.scan(/\d+|\+|\*/) }; o = n.pop;

puts n.inspect
ans = o.reduce([0, 0]) do |(acc, i), op|
  puts i
  if op == "+"
    r = [acc + n.length.times.reduce(0) { |sum, idx| sum + n[idx][i].to_i }, i + 1]
  elsif op == "*"
    r = [acc + n.length.times.reduce(1) { |sum, idx| sum * n[idx][i].to_i }, i + 1]
  end
  r
end

puts ans[0]
