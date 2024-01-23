dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
def substrings(word ,dictionary)
    dict = {}
    word = word.downcase.split(' ')
    dictionary.each do|dict_word|
        word_match = word.select do |word| 
            word.include?(dict_word)
        end
    dict[dict_word] = word_match.length if word_match.length != 0
    end
    dict
end
p substrings("Howdy partner, sit down! How's it going?", dictionary)
# { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
# {"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}