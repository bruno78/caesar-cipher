# Caesar-cipher

def caesar_cipher(string, offset)
  alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
            "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"] # Alphabet length = 26
  cipher = ''
  i = 0
  while i < string.length
    idx = alphabet.index(string[i])
    if idx == nil
      cipher += string[i]
    elsif idx + offset > 25
      cipher += alphabet[(idx + offset) % 26]
    else
      cipher += alphabet[idx + offset]
    end
    i += 1
  end
  cipher
end

puts caesar_cipher("my name is bruno", 5)

def decipher(string)

  common_words = %w{i you he she it we they is are there their to in on at will was were you're we're i'm
the're meet come it's o'clock time please time so just going gone place home house hello cat dog bye goodbye buy good bad yes no not don't din't wont my name mine your man men woman women kid boy girl day night monday tuesday wednesday thursday friday saturday sunday}

  word_set = string.split(' ')
  offset = 0
  condition = true
  idx = 0
  while condition
    word = word_set[idx]
    while offset < 26
      if common_words.include?(caesar_cipher(word, offset))
        condition = false
        break
      end
      offset += 1
    end
    idx += 1
  end
  caesar_cipher(string, offset)
end

puts decipher("khoor")
puts decipher("rd sfrj nx gwzst")
