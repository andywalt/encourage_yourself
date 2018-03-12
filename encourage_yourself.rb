
@anxiety = ["Anxiety does not empty tomorrow of its sorrows, but only empties today of its strength. -Charles Spurgeon", "If you want to conquer the anxiety of life, live in the moment, live in the breath. - Amit Ray", "If you want to conquer the anxiety of life, live in the moment, live in the breath.", "Good humor is a tonic for mind and body. It is the best antidote for anxiety and depression. It is a business asset. It attracts and keeps friends. It lightens human burdens. It is the direct route to serenity and contentment. - Grenville Kleiser", "We all have anxiety about things. We all have little insecurities, but eventually you have to face your fears if you want to be successful, and everybody has some fear of failure. - Nick Saban"]
@depression = ["Getting better from depression demands a lifelong commitment. I've made that commitment for my life's sake and for the sake of those who love me. — Susan Polis Schutz", "Once you choose hope, anything is possible. — Christopher Reeve", "A positive attitude gives you power over your circumstances instead of your circumstances having power over you. — Joyce Meyer", "Man is fond of counting his troubles, but he does not count his joys. If he counted them up as he ought to, he would see that every lot has enough happiness provided for it. — Fyodor Dostoevsky", "If you could only sense how important you are to the lives of those you meet; how important you can be to the people you may never even dream of. There is something of yourself that you leave at every meeting with another person. — Fred Rogers"]
@discouragement = ["In spite of everything I shall rise again: I will take up my pencil, which I have forsaken in my great discouragement, and I will go on with my drawing. - Vincent Van Gogh", "We’re so busy watching out for what’s just ahead of us that we don’t take time to enjoy where we are. – Calvin & Hobbes", "Life is like riding a bicycle. To keep your balance, you must keep moving. – Albert Einstein", "The struggle you’re in today is developing the strength you need tomorrow. – Robert Tew"]
@unlovely = ["Everyone is like a butterfly, they start out ugly and awkward and then morph into beautiful graceful butterflies that everyone loves. - Drew Barrymore", "Love means to love that which is unlovable; or it is no virtue at all. - Gilbert K. Chesterton", "Anyone can love a rose, but it takes a lot to love a leaf. - Tom Flynn", "Real love is when you are completely committed to someone even when they are being completely unlovable. - Dave Willis", "Connection is why we're here; it is what gives purpose and meaning to our lives. The power that connection holds in our lives was confirmed when the main concern about connection emerged as the fear of disconnection; the fear that something we have done or failed to do, something about who we are or where we come from, has made us unlovable and unworthy of connection. - Brené Brown"]

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


class Person
  attr_accessor :name
  def initialize
    puts "What is your name?"
    @name = name
    @name = gets.chomp.capitalize
    if name.empty?
      @name = "Amazing Human"
    end
    puts "Hello #{name}! We've got some encouragement for you!"
  end
  def self.get_name
    Person::name
  end
end

class Pain_Scale < Person
  def pain_level
    avar = Person.get_name  # I assume "avar" means "a variable"
    puts "On a scale of 1 to 10 (1 being Fantastic & 10 being Terrible), how do you feel?"
    pain_number = 0
    pain_number = gets.to_i
    puts "#{name}, you're feeling around a #{pain_number}."
  end
end


Pain_Scale.new.pain_level


#I'd like to use someone's name in the script below but I'm not sure how to make it accesible below. I think the local variable of "name" is limited to the class of Person
# but I'm unsure how to call it in another method (or in this case the loop below).

def feeling_help
  loop do
    puts <<-eos
    Are you feeling?
    Anxiety   Depression
    Discouragement  Unlovely
    Feeling Better (Exit)
    Type your answer below:
     eos
    feeling = gets.chomp.downcase
    case feeling
    when "anxiety"
     puts @anxiety.sample
     puts 
    when "depression"
     puts @depression.sample
     puts 
    when "discouragement"
     puts @discouragement.sample
     puts 
    when "unlovely"
      puts @unlovely.sample
      puts
    when "feeling better", "better", "exit", "no"
      abort("Awesome! Hope you're feeling better! Now go encourage someone else!")
    else
     puts "We don't have #{feeling} in our list. We know first hand how discouraging this could be. Try choosing one of the feelings listed above as we research more feelings."
     puts 
    end
    puts "Do you need more encouragement? (yes/no)"
    need_more = gets.chomp
    until need_more == 'yes'
      abort("Awesome! Hope you're feeling better! Now go encourage someone else!")
    end
  end
end

feeling_help
