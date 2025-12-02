s = ""
puts s.split(",").reduce(0) { |acc, r| rs = r.split('-'); rs[0].to_i.upto(rs[1].to_i) { |i| acc += i if i.to_s.size % 2 == 0 && i.to_s[0..i.to_s.size/2 - 1] == i.to_s[i.to_s.size/2, i.to_s.size] }; acc }

def invalid?(str)
  (str.size / 2).times do |i|
    return true if str[0..i]*(str.size / str[0..i].size) == str
  end

  false
end

ans = s.split(',').reduce(0) do |acc, pair|
  r1, r2 = pair.split('-').map(&:to_i)
  r1.upto(r2) { |i| acc += i if invalid?(i.to_s) }
  acc
end

puts ans
