class EuclideanVar
  attr_accessor :a, :b, :q, :r, :ta, :tb, :u, :v, :gcd, :sw
  
  def initialize(a,b)
    if a < b
      a,b = swap(a,b)
    end
    @ta = @a = a
    @tb = @b = b
    @q = a / b
    @r = a % b
  end
  
  def swap(a,b)
    a, b = b, a
    @sw = :true
    return a,b
  end
end

qq = Array.new()

x = ARGV[0] == nil ? 1000734201928668683395663 : ARGV[0].to_i
y = ARGV[1] == nil ? 1000700183531353790434769 : ARGV[1].to_i

eq = EuclideanVar.new(x,y)
qq = []
rr = [0,1]
vv = [1,0]

i=0

while true
  
  r = eq.a % eq.b
  q = eq.a / eq.b
  
  qq.push(q)
  
  puts eq.a.to_s + " = " + eq.b.to_s + " * " + q.to_s + " + " + r.to_s
  
  if r == 0
    eq.gcd = eq.b
    
    puts "\n\ngcd("+ eq.ta.to_s + "," + eq.tb.to_s + ") : " + eq.gcd.to_s
    
    qq.each_index do |i|
      rr[i+2] = qq[i]*rr[i+1]+rr[i]
      vv[i+2] = qq[i]*vv[i+1]+vv[i]
    end
    
    puts "\nquotiens:\n\t#{qq*','}\n\nrow u:\n\t#{rr*",\n\t"}\n\nrow v:\n\t#{vv*",\n\t"}\n\n"
    
    #A,B,U,V,Checksum
    eq.a = eq.ta
    eq.b = eq.tb
    eq.u = vv[vv.length-2]
    eq.v = rr[rr.length-2]*-1
    
    if eq.sw == :true
      eq.a = eq.tb
      eq.b = eq.ta
      eq.u = rr[rr.length-2]
      eq.v = vv[vv.length-2]*-1

    end
    
    if eq.u * eq.a + eq.v * eq.b == eq.gcd
      
      puts "u.a + v.b = 1 => OK :)"
      
    else 
      x = eq.u * eq.a + eq.v * eq.b
      
      puts "u.a + v.b = " + x.to_s  + "=> Not equal to 1 :("
      
    end
    
    #Print U,V
    puts "\ta:#{eq.a}, b:#{eq.b}\n\n"
    
    puts "\tu:#{eq.u}, v:#{eq.v}\n\n"
    
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
