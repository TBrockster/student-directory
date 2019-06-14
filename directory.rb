def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :november} 
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    students
end

def print_header
    puts "The students of Villians Academy"
    puts "-------------"
end

def print_specific_letter
    loop do
        puts "Would you like only print students beginning with a specific letter? y/n"
        ui = gets.chomp
        if ui.downcase == "n"
            return 0
        elsif ui.downcase == "y"
            puts "Please input the letter"
            ui_letter = gets.chomp
            return ui_letter
        else
            puts "Input not recognized"
        end
    end
end

def print(students)
    if @temp == 0
        students.each_with_index do |student, index|
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
    else
        students.each_with_index do |student, index|
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].chr == @temp 
        end
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

students = input_students
@temp = print_specific_letter
print_header
print(students)
print_footer(students)
