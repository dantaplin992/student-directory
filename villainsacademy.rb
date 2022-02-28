@students = []

def interactive_menu
    loop do
    # Print the menu and ask the user what to do
    puts "1. Input students"
    puts "2. Show students"
    puts "9. Exit"
    # Read the input and save it into a variable
    process(gets.chomp)
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
    name = gets.gsub("\n","")
    # while the name is not empty, repeat this code
    while !name.empty? do
        puts "Please enter the student's cohort"
        cohort = gets.chomp
        cohort = "unknown" if cohort.empty?
        # add the student has to the array
        @students << {name: name, cohort: cohort}
        @students.count == 1? s = "student" : s = "students"
        puts "now we have #{@students.count} #{s}"
        # gets another name from the user
        name = gets.chomp
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "-----------"
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
        sort_by_cohort.keys.each do |i|
            puts "#{i} Cohort: "
            sort_by_cohort[i].each { |name| puts name.center(30) }
        end
    end
end

def print_footer
    print "Overall we have #{@students.count}"
    puts " great students"
end

interactive_menu
