feelings = ["anxiety", "depression", "discouragement", "unlovely"]

input = nil
loop do
  print "Do you need some encouragement? (Yes or No)"
  input = gets.chomp

  if input.empty?
    puts "You didn't put anything. Please type Yes or No."
  elsif input == "no"
    abort("Awesome! Go encourage someone else!")
    break
  else
    puts "Well let's get started!"
    break
  end
end

name = nil
def welcome
 puts "What is your name?"
 name = gets.chomp.capitalize
 puts "Hello #{name}! I've got some encouragement for you!"
end

welcome

#Is there a way to put this whole loop in one object so I can call it with one word similar to "welcome"?

#I'd like to use someone's name in the script below but I'm not sure how to make it accesible below. I think the local variable of name is limited to the method of "welcome"
# but I'm unsure how to call it in another method (or in this case the loop below).

loop do
  puts <<-eos
  Are you feeling?
  Anxiety   Depression
  Discouragement  Unlovely
  Different Feeling
  Type your answer below:
   eos
  feeling = gets.chomp.downcase
  case feeling
  when "anxiety"
   puts "Anxiety does not empty tomorrow of its sorrows, but only empties today of its strength. -Charles Spurgeon"
   #I'd like to call an array (eventually randomized) of quotes here for each feeling.
  when "depression"
   puts "Depression is the inability to construct a future. -Rollo May"
  when "discouragement"
   puts <<-eos
   In spite of everything I shall rise again: 
   I will take up my pencil, 
   which I have forsaken in my great discouragement, 
   and I will go on with my drawing. 
   -Vincent Van Gogh
    eos
  when "unlovely"
   puts <<-eos
   "Everyone is like a butterfly, they start out ugly 
   and awkward and then morph into beautiful graceful 
   butterflies that everyone loves." 
   -Drew Barrymore
   eos
  else
   #feelings.push(answer) #I'd like to add the answered feeling to the array to eventually research quotes for that topic. Think this will be better used when I started using Ruby on Rails.
   puts "The feeling of #{feeling} will be added to our list and encouragement will be researched for the future. Try choosing one of the feelings listed above."
  end
  puts "Do you need more encouragement? (yes/no)"
  need_more = gets.chomp
  until need_more == 'yes'
    abort("Awesome! Hope you're feeling better! Now go encourage someone else!")
  end
end
