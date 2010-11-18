class EuclideanVar
  attr_accessor :a, :b, :q, :r, :ta, :tb, :u, :v, :gcd
  
  def initialize(a,b)
    if a < b
      a, b = b, a
    end
    @ta = @a = a
    @tb = @b = b
    @q = a / b
    @r = a % b
  end
end

qq = Array.new()

x = ARGV[0] == nil ? 1000734201928668683395663 : ARGV[0].to_i
y = ARGV[1] == nil ? 1000700183531353790434769 : ARGV[1].to_i

eq = EuclideanVar.new(x,y)
qq = Array.new()
rr = [0,1]
vv = [1,0]

i=0

while true
  
  r = eq.a % eq.b
  q = eq.a / eq.b
  
  qq.push(q)
  
  #puts eq.a.to_s + " = " + eq.b.to_s + " * " + q.to_s + " + " + r.to_s
  puts "a:"+ eq.a.to_s + "\tb:" + eq.b.to_s + "\tq:" + q.to_s + " \tr:" + r.to_s
  if r == 0
    eq.gcd = eq.b
    puts "gcd("+ eq.ta.to_s + "," + eq.tb.to_s + ") : " + eq.gcd.to_s
    
    qq.each_index do |i|
      rr[i+2] = qq[i]*rr[i+1]+rr[i]
      vv[i+2] = qq[i]*vv[i+1]+vv[i]
    end
    eq.u = vv[vv.length-2]*-1
    eq.v = rr[rr.length-2]
    puts qq
    puts rr
    puts vv
    puts "u:" + eq.u.to_s + "  v:" + eq.v.to_s
    
    if eq.u*eq.ta + eq.v*eq.tb == eq.gcd
      puts "u.a + v.b = 1 ? => OK :)"
    else 
      x = eq.u*eq.ta + eq.v*eq.tb
      puts "u.a + v.b = 1 ? => Not equal to 1 := " + x.to_s  + " :("
    end
    puts "count > " + i.to_s + "times"
    break
    
  else
    eq.a = eq.b
    eq.b = r
    eq.q = eq.a / eq.b
    eq.r = eq.a % eq.b
  end
  i+=1
end