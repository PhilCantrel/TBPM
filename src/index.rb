# reference required gems
require 'tty-prompt'
# gem setup
prompt = TTY::Prompt.new
# referencing required modules
require_relative './project'


puts "\n████████╗██████╗ ██████╗ ███╗   ███╗
╚══██╔══╝██╔══██╗██╔══██╗████╗ ████║
   ██║   ██████╔╝██████╔╝██╔████╔██║
   ██║   ██╔══██╗██╔═══╝ ██║╚██╔╝██║
   ██║   ██████╔╝██║     ██║ ╚═╝ ██║
   ╚═╝   ╚═════╝ ╚═╝     ╚═╝     ╚═╝
                                    "
puts "Welcome to Text Based Project Manager!"
on_start = prompt.select("\nWould you like to load an existing project, or create a new one\n", %w(Load Create))
if on_start == "Load"
    puts "insert load phase here"
    quit_program = false
    while quit_program == false
        status = prompt.select("#{$project_name} - Project Menu") do |menu|
            menu.choice "Project Overview"
            menu.choice "Project Overview With Due Dates"
            menu.choice "Add Task"
            menu.choice "Edit Task"
            menu.choice "Remove Task"
            menu.choice "Generate PDF"
            menu.choice "Exit"
        end
        if status == "Project Overview"
            Project.view
        elsif status == "Project Overview With Due Dates"
            Project.date_view
        elsif status == "Add Task"
            Project.new_task
        elsif status == "Edit Task"
            task = prompt.ask("Input the name of the task you wish to edit:")
            Project.edit_task(task)
        elsif status == "Remove Task"
            task = prompt.ask("Input the name of the task you wish to delete:")
            Project.delete_task(task)
        elsif
            status == "Generate PDF"
            Project.pdf
        else
            quit_program = prompt.yes?("Exit the program?")
        end
    end
else
    Project.create
    initial_class = prompt.yes?("Would you like to create your project's first task?")
    if initial_class == true
        Project.new_task
        another_task = true
        while another_task == true
            another_task = prompt.yes?("Would you like to create another task?")
            if another_task == true
                Project.new_task
            end
            puts $task_hash
        end
    end
end
