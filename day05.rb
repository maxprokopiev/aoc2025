r, _ = File.open('input05.txt').read.split("\n\n")
r = r.split("\n").map { |e| r1, r2 = e.split('-').map(&:to_i); [r1, r2] }

ans = r.sort_by!(&:first)[1..-1].reduce([r[0]]) do |acc, e|
  c = acc.last
  if c == e
    acc
  else
    if e[0] <= c[1]
      acc[0..-2] + [[c[0], [c[1], e[1]].max]]
    else
      acc + [e]
    end
  end
end.reduce(0) { |acc, e| acc + (e[1] - e[0] + 1) }

puts ans
