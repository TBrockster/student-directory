def input_students
    puts "Please enter the name of the first student."
    puts "To finish, just hit return twice."
    students = []
    tracker = 0
    name = gets.chomp
    while !name.empty? do
        students << {name: name} 
        if students.count == 1
            puts "Now we have #{students.count} student!"
        else
            puts "Now we have #{students.count} students!"
        end
        puts "Please enter #{students[tracker][:name]}'s cohort, or hit return for default (November)"
        cohort = gets.chomp
        students[tracker][:cohort] = cohort.downcase.to_sym
        students[tracker][:cohort] = :november if cohort.empty?
        puts "Please enter any hobbies #{students[tracker][:name]} has."
        hobby = gets.chomp
        students[tracker][:hobbies] = hobby
        puts "Please enter #{students[tracker][:name]}'s country of birth."
        country = gets.chomp
        students[tracker][:birth_country] = country
        puts "Please enter #{students[tracker][:name]}'s height."
        height = gets.chomp
        students[tracker][:height] = height
        tracker += 1
        puts "Please enter the name of the next student, or press enter to finish."
        name = gets.chomp
    end
    students
end

def print_header
    puts "The students of Villians Academy".center(50)
    puts "------------------".center(50)
end

def print(students)
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} - #{student[:cohort].capitalize} Cohort - Hobbies: #{student[:hobbies]} - Country of Birth: #{student[:birth_country]} - Height: #{student[:height]}"
    end
end

=begin
def print(students)
    tracker = 0
    while tracker < students.length
        puts "#{tracker + 1}. #{students[tracker][:name]} (#{students[tracker][:cohort]} cohort)".center(50)
        tracker += 1
    end
end
=end

def print_cohort(students)
    cohorts = []
    students.each do |student|
        cohorts << student[:cohort]
    end
    cohorts.uniq!
    cohorts_str = cohorts.join(", ").to_s
    puts "Please enter the cohort you would like printed"
    puts "We currently have the following cohorts: #{cohorts_str}"
    ui_cohort = gets.chomp
    print_header
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:cohort] == ui_cohort.downcase.to_sym
    end
end

def print_specific_letter(students)
    puts "Please enter the letter."
    psl_ui = gets.chomp
    print_header
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:name].chr == psl_ui
    end
end

def print_shortmode(students)
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:name].length < 12
    end
end

def print_footer(students)
    if students.count == 1
        puts "Overall, we have #{students.count} great student".center(50)
    else
        puts "Overall, we have #{students.count} great students".center(50)
    end
end

def prog_runner
    puts "Hi there, weclome to Villians Academy! Please populate our student list!"
    students = input_students
    puts "We have many available functions - please choose from the list below!"
    puts "
    1 - Print all students.
    2 - Print only students with names beginning with a specific letter.
    3 - Print only students with names shorter than 12 characters.
    4 - Print only students in a specific cohort"
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
    when "4"
        print_cohort(students)
        print_footer(students)
    end
end

prog_runner
