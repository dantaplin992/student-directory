
students = [
    {name: "Dr Hannibal Lecter", cohort: :february},
    {name: "Darth Vader", cohort: :february},
    {name: "Nurse Ratched", cohort: :february},
    {name: "Michael Corleone", cohort: :february},
    {name: "Alex DeLarge", cohort: :february},
    {name: "The Wicked Witch of the West", cohort: :february},
    {name: "Terminator", cohort: :february},
    {name: "Freddy Krueger", cohort: :february},
    {name: "The Joker", cohort: :february},
    {name: "Joffrey Baratheon", cohort: :february},
    {name: "Norman Bates", cohort: :february}
]

def print_header
    puts "The students of Villains Academy"
    puts "-----------"
end

def print_names(names)
    names.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(names)
    print "Overall we have #{names.count}"
puts " great students"
end

print_header
print_names(students)
print_footer(students)