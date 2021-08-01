$input_data = ''

ARGF.each_line do |line|
    $input_data += line
end

def min(input_text, n)
    ref = input_text[0]
    count = 1
    for i in 0...n
        if input_text[i] != ref
            count += 1
            ref = input_text[i]
        end
    end
   puts count
end

arr = $input_data.split(/\n+/)
t = arr[0].to_i

for i in 1..t*2
  next if i%2 == 0
  n = arr[i].to_i
  input_text = arr[i+1]
  min(input_text, n)
end
