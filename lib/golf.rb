class Golf
  class << self
    def hole1 a
      a.inject :*
    end
    
    def hole2 a
      a.split(" ").sort_by {|e| e[1]}.join " "
    end
    
    def hole3 a
      (1..a).inject :*
    end
    
    def hole4 a
      a.map do |e| 
        b = e.split(/\(|\)/)
        case b[0]
          when 'man' 
            b.unshift 'hat'
          when 'dog' 
            b << 'bone'
          when 'cat' 
            b[0] = 'dead'
        end
        b.join('(') + ')'*(b.length-1)
      end
    end
    
    def hole5 a
      b = []
      (1..a.length).each {|n| a.each_cons(n) {|e| b << e } }
      b
    end
    
    def hole6 a
      (1..a).map {|e| e % 15 == 0 ? "fizzbuzz" : e % 5 == 0 ? "buzz" : e % 3 == 0 ? "fizz" : e }
    end
    
    def hole7 a
      b = a.inject([[]]) {|m,e| m[-1][-1] == e-1 ? m[-1] << e : m << [e]; m}
      b.shift
      b.map {|e| e[0] == e[-1] ? e[0].to_s : "#{e[0]}-#{e[-1]}" }
    end
    
    def hole8 a
      m = [1,1]
      (a-2).times {|e| m << (m[-1]+m[-2])}
      m
    end
    
    def hole9 f
      b = []
      File.foreach(f) {|l| b << l.split(/,?\s/) }
      av b
    end
    
    def av a
      c = a.inject({}) {|m,e| m[e[0]] = 1 + (m[e[0]] || 0) ; m}
      d = c.to_a.sort_by{|e| e[1]}
      d[-1][1]*2 > a.length ? 
        d[-1][0] :
        (av a.map{|e| e.reject{|f| f == d[0][0]}}.reject{|e| e == []})
    end
  end
end
