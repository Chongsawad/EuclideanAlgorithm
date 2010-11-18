class CountString
  attr_accessor :v, :ws, :rr
  
  def initialize(u)
    @v = u == nil ? "BGUTBMBGZTFHNLXMKTIPBMAVAXXLXTEPTRLEXTOXKHHFYHKMAXFHNLX" : u
    @v = @v.upcase.gsub(/[^\w]/,"")
    @ws = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    @rr=[]
    self.CountAll
  end
  def CountAll
    @ws.each do |w|
      vv = @v.count w.to_s
      if vv != 0
        @rr.push("#{vv}:#{w.to_s}")
      end
    end
    @rr.sort.reverse.each { |r| print "#{r} \t"}
    puts "\n"
  end
end

dd = CountString.new(ARGV[0])




