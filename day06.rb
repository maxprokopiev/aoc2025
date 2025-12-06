lines = File.open("sample06.txt").read
n = []; o = []; lines.each_line { |l| n << l.scan(/\d+|\+|\*/) }; o = n.pop;

def transpose(a)
  a[0].length.times.map { |i| a.map { |e| e[i] } }
end

def solve(n, o)
  o.reduce([0, 0]) { |(acc, i), op| [acc + n[i].map(&:to_i).reduce(op.to_sym), i + 1] }[0]
end

puts solve(transpose(n), o)

n = transpose(lines.each_line.to_a).map(&:join).map(&:to_i).join(",").split(",0,").map { |l| l.split(",") }
puts solve(n, o)
