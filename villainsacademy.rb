require 'csv'

@students = []
@save_file_name = ""

def interactive_menu
    loop do
    # Print the menu and ask the user what to do
    puts "\n"
    puts "1. Input students"
    puts "2. Show students"
    puts "3. Save students"
    puts "4. Load students"
    puts "9. Exit"
    puts "\n" 
    # Read the input and save it into a variable
    process(get_stdin)
    # Do what the user has asked
    
    # repeat from step 1
    end
end

def process(input)
    case input
    when "1"
        input_students
    when "2"
        print_header
        print_by_cohort
        print_footer
    when "3"
        save_students
    when "4"
        load_students
    when "9"
        exit
    else
        puts "I don't know what you meant - please try again"
    end
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name
    name = get_stdin
    # while the name is not empty, repeat this code
    while !name.empty? do
        puts "Please enter the student's cohort"
        cohort = get_stdin
        cohort = "unknown" if cohort.empty?
        # add the student has to the array
        add_student(name, cohort)
        @students.count == 1? s = "student" : s = "students"
        puts "now we have #{@students.count} #{s}"
        # gets another name from the user
        name = get_stdin
    end
    puts "Students added successfully"
end

def print_header
    put_c("\nThe students of Villains Academy")
    put_c("-----------")
end

def print_names(names)
    i = 0
    until i == names.length do 
        student = names[i]
        print "#{i + 1}."
        puts (" #{student[:name]} (#{student[:cohort]} cohort)").center(50)
        i += 1
    end
end

def print_by_cohort
    if @students.length > 0
        sort_by_cohort = {}
        @students.each do |student|
            if !sort_by_cohort.include?(student[:cohort])
                sort_by_cohort[student[:cohort]] = [student[:name]]
            else
                sort_by_cohort[student[:cohort]].push(student[:name])
            end
        end
        sort_by_cohort.each do |key, value|
            put_c("#{key.capitalize} Cohort: ")
            value.each { |name| put_c(name) }
        end
    end
end

def print_footer
    put_c("Overall we have #{@students.count} great students\n\n")
end

def save_students
    # File.open(get_file_name, "w") do |file|
    #     @students.each do |student|
    #         student_data = [student[:name], student[:cohort]]
    #         csv_line = student_data.join(",")
    #         file.puts csv_line
    #     end
    # end
    CSV.open(@save_file_name, "w") do |file|
        @students.each do |student|
            student_data = [student[:name], student[:cohort]]
            file.puts(student_data)
        end
    end
    puts "Students saved successfully"
end

def load_students
    @students = []
    CSV.foreach(@save_file_name) { |row| add_student(row[0], row[1]) }
    puts "#{@students.count} students loaded from #{@save_file_name}"
end

def try_load_students
    ARGV.first.nil? ? @save_file_name = get_file_name : @save_file_name = ARGV.first
    if File.exists?(@save_file_name)
        load_students
    else
        puts "Sorry, #{@save_file_name} does not exist"
        exit
    end
end

def add_student(student_name, student_cohort)
    @students << { name: student_name, cohort: student_cohort}
end

def get_stdin
    STDIN.gets.chomp
end

def put_c(text)
    puts text.center(30)
end

def get_file_name
    puts "Please enter the name of the save file"
    return get_stdin
end

try_load_students
interactive_menu

# current_file = File.open(__FILE__, "r")
# current_file.readlines.each do |line|
#     puts line
# end
