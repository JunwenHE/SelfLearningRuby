=begin
  Author: Junwen HE
  Date: 16/FEB/2019
  This solution of enumerable methods is to gets mixed methods from the Array
  and Hash classes methods by the Enumerable module. The following iterator methods
  are based on the original class methods and combine together. Since the different
  data type between hash and array, each method need to identify certain data type and then
  execute the default statement if block statement was not provided by user. 
=end
module Enumerable
  def my_each
    if self.class == Hash
      for element in self do 
        yield(element[0].to_s, element[1]) 
      end
    else
      0.upto(self.length - 1) {|element| yield(self[element])}
    end
  end

  def my_each_index
    if self.class == Hash
      index = 0
      for element in self do 
        yield(element[0].to_s, element[1], index)
        index += 1
      end
    else
      0.upto(self.length - 1) {|element| yield(self[element], element)}
    end
  end

  def my_select
    if self.class == Hash
      hash = Hash.new
      for element in self do 
        hash[element[0]] = element[1] if yield(element[0], element[1])
      end
      hash
    else
      array = Array.new
      self.my_each {|element| array << element if yield(element)}
      array
    end
  end

  def my_all?
    all = true
    if self.class == Hash
      for element in self do 
        all = false if !yield(element[0], element[1]) if block_given?
      end
    else
      self.my_each {|element| all = false unless yield(element)} if block_given?
    end
    all
  end

  def my_any?
    any = false
    if block_given?
      if self.class == Hash
        any_hash = Hash.new
        for element in self do 
          any_hash[element[0]] = element[1] if yield(element[0],element[1])
          any = true if any_hash.length > 0
        end
      else
        any_element = Array.new
        self.my_each {|element| any_element << element if yield(element)} 
        any = true if any_element.length > 0
      end
    else
      any = true
    end
    any
  end

  def my_none?
    none = false
    if block_given?
      if self.class == Hash
        for element in self do 
          none = true unless yield(element[0],element[1])
       end
      else
       self.my_each {|element| none = true unless yield(element)}
      end
    else
      none = false
    end
    none
  end

  def my_count
    count = 0
    if block_given?
      if self.class == Hash
        for element in self do 
          count += 1 if yield(element[0],element[1])
        end
      else
        self.my_each {|element| count += 1 if yield(element)}
      end
    else
      if self.class == Hash 
        for element in self do 
          count += 1
        end
      else
        self.my_each {|element| count +=1}
      end
    end
    count
  end

  def my_map proc=nil
    map_list = Array.new
    if self.class == Hash
      for element in self do 
        proc ? map_list << proc.call(element[0],element[1]) : map_list << yield(element[0], element[1])
      end
    else
      self.my_each {|element| proc ? map_list << proc.call(element) : map_list << yield(element)}
    end
    map_list
  end

  def my_inject(result)
    if self.class == Hash
      for element in self do 
        result = yield(result, [element[0],element[1]])
      end
    else
      self.my_each {|element| result = yield result, element}
    end
    result
  end

end

def multiply_els(array)
  array.my_inject(1){|a, b| a * b}
end

#hash = {one: 1, two: 2, three: 3, four: 4, five: 5}
#array = [1,2,3,4,5]

#Testing:
#array.my_each {|i| puts i}
#array.my_each_index {|i,j| puts i.to_s + " " + j.to_s}
#puts array.my_select {|i| i > 5}
#puts array.select {|i| i > 5}
#puts array.my_all? {|x| x < 5}
#puts array.my_none? {|x| x < 5}
#puts array.my_any? {|x| x < 3}
#puts array.my_count {|i| i > 2}
#puts ["A","B"].my_map {|x| x.upcase}
#puts multiply_els([2,4,5])

#puts hash.my_each {|i,j| print "#{i}: #{j}" }
#hash.my_each {|key, value| puts "#{key}: #{value}"}
#hash.my_each_index {|key, value, index| puts "#{index}"}
#puts hash.my_select{|k, v| k.length > 3}
#p hash.my_all? {|k,v| v > 5}
#p hash.my_none? {|k,v| v > 5}
#p hash.my_any? {|k,v| v > 5}
#p hash.my_count {|k,v| v < 5}
#p hash.my_map{|k, v| {k.to_s => v*2}}
#hash_proc = Proc.new{|k, v| {k.to_s => v*3}}
#p hash.my_map(hash_proc)
#p hash.my_inject(""){|a, (k, v)| a += k.to_s + v.to_s}