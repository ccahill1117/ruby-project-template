require('fileutils')

project_directory = ARGV[0]
ARGV.clear

if project_directory
  if File.directory?(project_directory)
    puts "are you sure you want to delete #{project_directory}? Press 'y' to delete"
    user_response = gets.chomp
    if user_response == "y"
      FileUtils.rm_rf("./#{project_directory}")
    else
      puts "#{project_directory} has not been deleted"
    end
  else
    puts "#{project_directory} does not exist"
  end
else
  puts "Please supply a project directory "
end
