=begin
  Author: Junwen HE
  Date: 9/FEB/2019
  This is a solution of bubble sort which is based on the pseudocode implementation
  of bubble sort from Wikipedia "https://en.wikipedia.org/wiki/Bubble_sort".
  Using nested iterators to find identify which is higher value in two related elements.
  The second method of bubble sort which is used to order the element based on the length of the word.
=end
def bubble_sort(value_array)
  1.upto(value_array.length - 1) do |i|
    0.upto(value_array.length - 1 - i) do |j|
      if value_array[j] > value_array [j + 1]
        value_array[j], value_array[j + 1] = value_array[j + 1], value_array[j]
      end
    end
  end
  puts value_array.to_s
end

def bubble_sort_by(value_array)
  1.upto(value_array.length - 1) do |i|
    0.upto(value_array.length - 1 - i) do |j|
      if (yield(value_array[j],value_array[j+1]) > 0)
        value_array[j], value_array[j + 1] = value_array[j + 1], value_array[j]
      end
    end
  end
  puts value_array.to_s
end

bubble_sort([4,3,78,2,0,2])
bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
  left.length - right.length
end
