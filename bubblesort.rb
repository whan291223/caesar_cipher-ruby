def bubble_sort(num_array)
    need_sort = 0 #flag raise
    k = -2 #limiter
    num_array.length.times do
        num_array[0..k].length.times do |index|
            # p index
            if num_array[index+1] != nil and num_array[index] > num_array[index+1]
                need_sort = 1
                # puts "#{num_array[index]} > #{num_array[index+1]}"
                num_array[index],num_array[index+1] = num_array[index+1],num_array[index]
            end
        end
        break if need_sort == 0 #flag not raise,no need to sort
        need_sort= 0
        k -= 1 # increse limiter at the end
        # p num_array
    end
    p num_array
end


bubble_sort([4,3,78,2,0,2])
#   [0,2,2,3,4,78]