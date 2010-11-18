class JuliusCaesar
  attr_accessor :c, :ck, :m, :mk, :clk, :sh
  CLKWISE = 1
  COUNTERCLKWISE = 2
  
  def initialize
    @ck = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    @mk = Array.new(@ck)
    @mk.collect! { |mk| mk.downcase }
    @clk = CLOCKWISE
    @sh = 1
    
    self.shiftCipherWheel
  end
  
  def shiftCipherWheel
    s="A page of history is worth a volume of logic."
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
      
    print("Plaintext \t: #{@mk*','}\nCipherText \t: #{@ck*','}\n")
  end
  
end

jj = JuliusCaesar.new()



