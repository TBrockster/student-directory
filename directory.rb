# Let's put all students into an array
students = [
    "The students of Villians Academy",
    "-------------",
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Kruegar",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
]
# and then print them
students.each do |student|
    puts student
end
# finally, we print the total number of students
puts "Overall, we have #{student.count} great students"
