def input_students
    puts "Please enter the names of the students."
    puts "To finish, just hit return twice."
    students = []
    name = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :november} 
        puts "Now we have #{students.count} students!"
        name = gets.chomp
    end
    students
end

def print_header
    puts "The students of Villians Academy"
    puts "--------------------------------"
end

=begin
def print(students)
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end
=end

def print(students)
    tracker = 0
    while tracker < students.length
    puts "#{tracker + 1}. #{students[tracker][:name]} (#{students[tracker][:cohort]} cohort)"
    tracker += 1
    end
end

def print_specific_letter(students)
    puts "Please enter the letter."
    psl_ui = gets.chomp
    print_header
    students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].chr == psl_ui
    end
end

def print_shortmode(students)
    students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

def prog_runner
    puts "Hi there, weclome to Villians Academy! Please populate our student list!"
    students = input_students
    puts "We have many available functions - please choose from the list below!"
    puts "
    1 - Print all students.
    2 - Print only students with names beginning with a specific letter.
    3 - Print only students with names shorter than 12 characters."
    pr_ui = gets.chomp
    case pr_ui
    when "1"
        print_header
        print(students)
        print_footer(students)
    when "2"
        print_specific_letter(students)
        print_footer(students)
    when "3"
        print_header
        print_shortmode(students)
        print_footer(students)
    end
end

prog_runner
