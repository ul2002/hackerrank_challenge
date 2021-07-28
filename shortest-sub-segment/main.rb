# Enter your code here. Read input from STDIN. Print output to STDOUT
def contains(text, words)
    matches = 0
    downcased = text.map(&:downcase)
    for i in 0...words.length
      matches = matches + 1 if downcased.include? words[i]
    end
    return matches
end

def shortest_sub_segment(input_data)
    lines = input_data.split(/\n+/)
    text = lines[0].gsub(/[[:punct:]]/, '').split(" ")
    size = lines[1]
    words = lines.drop(2)
    result = NOT_FOUND
    i = 0
    while i < text.length
      if words.include? text[i].downcase
          j = text.length-1
          while j >= size.to_i
            if words.include? text[j].downcase
                sub_text = text.slice(i..j)
                r = contains(sub_text, words)
                result = sub_text if ((r == size.to_i) && ((result.length > sub_text.length) || (result == NOT_FOUND )))
            end
            j -= 1
          end
          break if result.length == size 
      end
      i += 1
    end
    result = result.join(' ') if result != NOT_FOUND
    return result
end

$input_data = ''
NOT_FOUND = "NO SUBSEGMENT FOUND"
ARGF.each_line do |line|
    $input_data += line
end
    
puts shortest_sub_segment($input_data)