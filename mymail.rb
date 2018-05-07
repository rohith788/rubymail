require 'mail'
require 'io/console'


def sendit(sendm, recvm, body, pass, sub)
  options = { :address              => "smtp.gmail.com",
              :port                 => 587,
              :domain               => 'your.domain.com',
              :user_name            => "#{sendm}",
              :password             => "#{pass}",
              :authentication       => 'plain',
              :enable_starttls_auto => true  }
              puts options["username"]
              puts options["password"]



  Mail.defaults do
    delivery_method :smtp, options
  end

  Mail.deliver do
         to "#{sendm}"
       from "#{recvm}"
    subject "#{sub}"
       body "#{body}"
       puts "email sent"
  end
end

def usr(email)
  arr = email.split("")
  usrname = ""
  arr.each do |word|
    if(word == "@")
      break
    end
    usrname = usrname.concat(word) 
  end
  puts usrname
end

puts "Hey! So, wanna send a mail?? \nOfcouse you do.\nSo....\n"
puts "Give me you email id(gmail)-"
email = gets.chomp
puts "Next, password please...."
password = STDIN.noecho(&:gets).chomp
puts "A subject pls..."
subj = gets.chomp
puts "The body here pls...."
body = gets.chomp
puts "And who do you wannt to send it to?"
sendm = gets.chomp  
sendit(email, sendm, body, password, subj)