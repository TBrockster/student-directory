require 'csv'
@students = []

def input_students
    puts "Please enter the name of the first student."
    puts "To finish, just hit return twice."
    tracker = 0
    tracker += @students.count
    name = STDIN.gets.strip
    while !name.empty? do
        @students << {name: name}
        if @students.count == 1
            puts "Now we have #{@students.count} student!"
        else
            puts "Now we have #{@students.count} students!"
        end
        puts "Please enter #{@students[tracker][:name]}'s cohort, or hit return for default (November)"
        cohort = STDIN.gets.chomp
        @students[tracker][:cohort] = cohort.downcase.to_sym
        @students[tracker][:cohort] = :november if cohort.empty?
        puts "Please enter any hobbies #{@students[tracker][:name]} has."
        hobby = STDIN.gets.chomp
        @students[tracker][:hobbies] = hobby
        puts "Please enter #{@students[tracker][:name]}'s country of birth."
        country = STDIN.gets.chomp
        @students[tracker][:birth_country] = country
        puts "Please enter #{@students[tracker][:name]}'s height."
        height = STDIN.gets.chomp
        @students[tracker][:height] = height
        tracker += 1
        puts "Please enter the name of the next student, or press enter to finish."
        name = STDIN.gets.chomp
    end
end

def print_header
    puts "The students of Villians Academy".center(50)
    puts "------------------".center(50)
end

def print_students_list
    @students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} - #{student[:cohort].capitalize if student[:cohort] != nil} Cohort - Hobbies: #{student[:hobbies]} - Country of Birth: #{student[:birth_country]} - Height: #{student[:height]}"
    end
end

# def print_students_list
#     tracker = 0
#     while tracker < @students.length
#         puts "#{tracker + 1}. #{@students[tracker][:name]} (#{@students[tracker][:cohort]} cohort)".center(50)
#         tracker += 1
#     end
# end

def print_cohort
    cohorts = []
    @students.each do |student|
        cohorts << student[:cohort]
    end
    cohorts.uniq!
    cohorts_str = cohorts.join(", ").to_s
    puts "Please enter the cohort you would like printed"
    puts "We currently have the following cohorts: #{cohorts_str}"
    ui_cohort = STDIN.gets.chomp
    print_header
    @students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:cohort] == ui_cohort.downcase.to_sym
    end
end

def print_specific_letter
    puts "Please enter the letter."
    psl_ui = STDIN.gets.chomp
    print_header
    @students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:name].chr.downcase == psl_ui.downcase
    end
end

def print_shortmode
    @students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:name].length < 12
    end
end

def print_footer
    if @students.count == 1
        puts "Overall, we have #{@students.count} great student".center(50)
    else
        puts "Overall, we have #{@students.count} great students".center(50)
    end
end

# def save_students(filename = "students.csv")
#     File::open(filename, "w" ) do |f|
#         @students.each do |student|
#             student_data = [student[:name], student[:cohort]]
#             csv_line = student_data.join(",")
#             f.puts csv_line
#         end
#     end
#     puts "File Saved"
# end

def save_students(filename = "students.csv")
    CSV.open(filename, "w") do |csv|
        @students.each do |student|
            csv << [student[:name], student[:cohort]]
        end
    end
    puts "File Saved"
end

# def load_students(filename = "students.csv")
#   File::open(filename, "r") do |f|
#   f.readlines.each do |line| 
#   name, cohort = line.chomp.split(',')
#     @students << {name: name, cohort: cohort.to_sym}
#   end
#   puts "File Loaded"
# end

def load_students(filename = "students.csv")
  f = CSV.read(filename)
  f.each do |a, b| 
  name, cohort = a, b
    @students << {name: name, cohort: cohort.to_sym}
  end
  puts "File Loaded"
end

def try_load_students
  filename = ARGV.first
  load_students if filename.nil?
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def print_menu
    puts "We have many available functions - please choose from the list below!"
    puts "
    1 - Input students.
    2 - Print all students.
    3 - Print only students with names beginning with a specific letter.
    4 - Print only students with names shorter than 12 characters.
    5 - Print only students in a specific cohort.
    6 - Save student list.
    7 - Load student list.
    8 - Exit this directory."
end

def choice(pr_ui)
    case pr_ui
        when "1"
            input_students
        when "2"
            print_header
            print_students_list
            print_footer
        when "3"
            print_specific_letter
            print_footer
        when "4"
            print_header
            print_shortmode
            print_footer
        when "5"
            print_cohort
            print_footer
        when "6"
            puts "Please enter a file name to save to, or enter to use default."
            save_ui = gets.chomp
            save_ui.empty? ? save_students : save_students(save_ui)
            when "7" 
            puts "Please enter a file name to load from, or enter to use default."
            load_ui = gets.chomp
            load_ui.empty? ? load_students : save_students(load_ui)
        when "8"
            puts "Goodbye!"
            exit
        else
            puts "Input not recognized"
    end
end

def prog_runner
    try_load_students
    loop do
        print_menu
        choice(STDIN.gets.chomp)
    end
end

prog_runner
# puts "There are no students in our directory" if @students.empty? 
# exit if @students.empty?
