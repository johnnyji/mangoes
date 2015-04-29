def apple
  puts "hello"
  puts lambda { return "lambda" }.call
  puts "bye"
end


def banana
  puts "hello"
  puts Proc.new { return "proc" }.call
  puts "bye"
end

apple
banana