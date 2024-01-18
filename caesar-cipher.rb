# # 5.times { puts "Hello Jedai!"}
# [5,4,3,2,1].each.with_index do |num, index| 
#     puts "#{num} was passed to the block -> index : #{index}" 
# end
# # p [5,4,3,2,1].collect { |index| index.odd? }
# # p [5,4,3,2,1].select { |index| index.odd? }
# # p [5,4,3,2,1].detect { |index| index.odd? }

# require 'pry-byebug'

def caesar_cipher(word,shift_num)
    
    aftershift = word.split('').map do |alphabet| 
        if alphabet.match(/[A-Z]/)
            new_word_ascii = alphabet.ord + shift_num 
            new_word_ascii = new_word_ascii + 26  if new_word_ascii < 65
            new_word_ascii = new_word_ascii - 26  if new_word_ascii > 90
        elsif alphabet.match(/[a-z]/)
            new_word_ascii = alphabet.ord + shift_num 
            new_word_ascii = new_word_ascii + 26  if new_word_ascii < 97
            new_word_ascii = new_word_ascii - 26  if new_word_ascii > 122 
            # puts "#{new_word_ascii.chr} ---> #{new_word_ascii} ---> #{alphabet}"

        else
            # p alphabet.match(/\w/)
            new_word_ascii = alphabet.ord
        end
        new_word = new_word_ascii.chr
    end.join()
    p aftershift
end

caesar_cipher("What a string!", 5)
# isogram?("Odin")