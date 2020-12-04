# require "./db/staff.rb"


staffs_db = [
  {
    username: "jack",
    password: "topsecret"
  },
  {
    username: "mark",
    password: "topsecret"
  },
  {
    username: "elon",
    password: "topsecret"
  },
]

students_db = [
  {
    username: "youthisboy",
    password: "topsecret"
  },
  {
    username: "tomiszn",
    password: "topsecret"
  },
  {
    username: "anis",
    password: "topsecret"
  },
]


puts "Welcome To UNILAG"
20.times {print "-"}
puts




def login(param, users_db)
  puts "#{param} Login"
  20.times {print "-"}
  puts
  puts "Enter your username"
  username = gets.chomp
  system ("clear")  # Clears The Terminal to reduce cluster
  puts "Enter your password"
  password = gets.chomp
  system ("clear")  # Clears The Terminal to reduce cluster

  users_db.each do |user|
    if user[:username] == username
      if user[:password] == password
        return "There was a match"
      else
        return "Sorry the password was incorrect for the #{param} \"#{user[:username]}\""
      end
    end
  end
  return "Sorry no #{param} by the username \"#{username}\" found."
end



attempts = 3
until attempts == 0
  puts "Type one of the number options in bracket and press enter."
  puts "(1) Staff"
  puts "(2) Student"
  puts "(3) Quit"
  puts
  puts "Expected Input: 1, 2 or 3"
  welcome_input = gets.chomp
  system ("clear")  # Clears The Terminal to reduce cluster
  if welcome_input == "1"
    puts login("Staff", staffs_db)
  elsif welcome_input == "2"
    puts login("Student", students_db)
  elsif welcome_input == "3"
    break
  end
  attempts -=1
  puts
  if attempts > 0
    puts "You have #{attempts} attempts left."
  else
    puts "You have exceeded the allowed number of attempts."
  end
end