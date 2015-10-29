# Caesar-cipher v. 1.0
# Decipher version v. 2.1 using linux word dictionary

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

def check_for_words(word)
  words = {}
  File.open("/usr/share/dict/words") do |file|
    file.each do |line|
      words[line.strip] = true
    end
  end
  words.has_key?(word)
end

def decipher(string)

=begin
  common_words = %w{i you he she it we they is are there their to in on at will was were you're we're i'm
the're meet come it's o'clock clock watch see take push pick pickup up down side beside be time please time so just going gone place home house hello cat dog bye goodbye buy good bad yes no not don't din't wont my name mine your man men woman women if else more less just years year old kid boy girl day night monday tuesday wednesday thursday friday saturday sunday january february march april may june july august september october november december could should would live die leave }
=end

  word_set = string.split(' ')
  offset = 0
  condition = true
  idx = 0
  while condition
    word = word_set[idx]
    while offset < 26
      cipher = caesar_cipher(word, offset)

      if word_set.length == 1 && (common_words.include?(cipher) || check_for_words(cipher))
        condition = false
        break
      elsif word_set.length > 1
        word2 = word_set[idx+1]
        cipher2 = caesar_cipher(word2, offset)
        if common_words.include?(cipher) || (check_for_words(cipher) && check_for_words(cipher2))
          condition = false
          break
        end
      end
      offset += 1
    end
    idx += 1
  end
  caesar_cipher(string, offset)
end

puts caesar_cipher("my name is bruno", 5) == "rd sfrj nx gwzst"
puts decipher("khoor") == "hello"
puts decipher("rd sfrj nx gwzst") == "my name is bruno"
