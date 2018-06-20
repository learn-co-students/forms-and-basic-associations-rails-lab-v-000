# puts "I'm in scope" # scope test

Pry::Commands.alias_command 'n', 'exit'

def x
  exit!
end  
  
