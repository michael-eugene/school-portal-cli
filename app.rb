require "./classes/student.rb"


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




def auth_login(param, users_db)
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
        return "Welcome \"#{username}\". What would you like to do?"
      else
        return "Sorry the password was incorrect for the #{param} \"#{user[:username]}\""
      end
    end
  end
  return "Sorry no #{param} by the username \"#{username}\" found."
end

def add_student(users_db)
  puts "Enter student username"
  username = gets.chomp
  puts "Enter student password"
  password = gets.chomp
  record = Student.new("#{username}", "#{password}")
  users_db.push(record.info)
  system ("clear")
  return "Student Record has been successfuly updated."
end




attempts = 10
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
    puts auth_login("Staff", staffs_db)
    # Funtion to add student record
    puts "Please Choose an option"
    puts "(1) Update Student Record"
    puts "(2) Show Student Record"
    puts "(3) Quit"
    puts
    input = gets.chomp
    system ("clear")
    case input
    when "1" then puts add_student(students_db)
    when "2" then puts students_db 
    when "3" then break 
    else
      puts "hello"
    end
  elsif welcome_input == "2"
    puts auth_login("Student", students_db)
    # funtion to view student record
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

