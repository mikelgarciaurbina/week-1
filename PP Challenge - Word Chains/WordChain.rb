require 'ruby-dictionary'
require 'pry'

class WordChain
    def initialize(dictionary)
        @dictionary = dictionary
    end

    def find_chain(word1, word2)
      if check_word(word1) && check_word(word2)
        while word1 != word2
          #Buscamos palabra
          word1 = search_word(word1, word2)
          #Imprimimos la palabra encontrada
          puts word1
        end
      else
        puts ="Las palabras introducidas son incorrectas"
      end
    end

    def search_word(word1, word2)
      arr_word1 = word1.split("")
      arr_word2 = word2.split("")

      #puts "Array1: " + arr_word1.join
      #puts "Array2: " + arr_word2.join


      arr_word1.each_with_index do |letter, i|
        aux = Array.new arr_word1

        if arr_word1[i] != arr_word2[i] 

          #puts "Intercambiamos #{aux[i]} por #{arr_word2[i]} "
          aux[i] = arr_word2[i]

          if check_word aux.join
            #puts "Existe la palabra #{aux.join} ->  #{arr_word1.join} #{arr_word2.join}"
            arr_word1[i] = arr_word2[i]
            return arr_word1.join
          else
            puts "No existe la palabra #{aux.join} "
            aux[i] = arr_word1[i]
          end

        end

      end

    end

    def check_word(word)
      @dictionary.exists?(word)
    end
end
