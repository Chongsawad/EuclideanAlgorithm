class JuliusCaesar
  attr_accessor :ck, :m, :mk, :clk, :sh, :map
  CLOCKWISE = "R"
  COUNTERCLOCKWISE = "L"
  
  def initialize(m,sh,clk)
    @m = m == nil ? "A page of history is worth a volume of logic." : m
    @m = @m.downcase.gsub(/[^\w]/,"")
    
    @ck = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    @map = {}
    @mk = Array.new(@ck)
    @mk.collect! { |mk| mk.downcase }
    
    @clk = clk == nil ? CLOCKWISE : clk
    @sh = sh.to_i == nil ? 0 : sh.to_i
    
    self.shiftCipherWheel
  end
  
  def shiftCipherWheel
    
    if @clk == CLOCKWISE
      @sh.times do
        t = @ck.shift
        @ck = @ck.push(t)
      end
    else
      @sh.times do
        t = @ck.pop
        @ck = @ck.unshift(t)
      end
    end

    print("Letters \t: #{@mk*','}\nCipherKeys \t: #{@ck*','}\n")
    
    26.times do |i|
      @map[@mk[i]] = @ck[i]
    end
    print "Plaintext\t: #{@m}\n"
    print "Ciphertext\t: "
    @m.each_char { |ss| print "#{@map[ss]}" }
    puts "\n"
  end
  
end

jj = JuliusCaesar.new(ARGV[0],ARGV[1],ARGV[2])



