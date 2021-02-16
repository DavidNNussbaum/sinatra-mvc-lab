# class PigLatinizer
#     attr_accessor :text
#     def initialize(text)
#         text = text.split
#     end

#     def piglatinize
#         # a = text.chars                    #split(" ")
#         b = text.collect {|word| piglatinize_word(word)}
#         b.join(" ")
#     end

#     def piglatinize_word(word)
#         first_letter = word[0].downcase
#         if first_letter == "a" || first_letter == "e" || first_letter == "i" || first_letter == "o" || first_letter == "u"
#             # Can also use: if ["a", "e", "i", "o", "u"].include?(first_letter)
#         "#{word}way"
#             # piglatinize word that starts with a vowel
#         else
#             # piglatinize word that starts with a consonant
#             consonants = []
#             consonants << word[0]
#               if ["a", "e", "i", "o", "u"].include?(word[1]) == false
#                 consonants << word[1]
#                 if ["a", "e", "i", "o", "u"].include?(word[2]) == false
#                   consonants << word[2]
#                 end
#               end
#             "#{word[consonants.length..-1] + consonants.join + "ay"}"
#         end
#     end
# end

class PigLatinizer
    def piglatinize(input_str)
        input_str.split(" ").map{ |word| piglatinize_word(word)}.join(" ")
    end

    private

    def vowel?(char)
        char.match(/[aAeEiIoOuU]/)
    end

    def piglatinize_word(word)
      # word starts with vowel
       if vowel?(word[0])
        word + "way"
       else
          # word starts with one or more consonants
          vowel_index = word.index(/[aAeEiIoOuU]/)
          consonants = word.slice(0..vowel_index-1)
          word_leftover = word.slice(vowel_index..word.length)
         word_leftover + consonants + "ay"
        end
    end
end