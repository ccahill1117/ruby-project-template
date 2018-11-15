require('fileutils')

project_directory = ARGV[0]
ARGV.clear

if project_directory
  puts FileUtils.pwd()
  FileUtils.mkdir("./#{project_directory}")
  FileUtils.cd("./#{project_directory}")
  FileUtils.mkdir("./spec")
  FileUtils.mkdir("./lib")
  # FileUtils.touch("./Gemfile")
  file = File.open("./Gemfile", 'w') do |file|
    file.write("hello")
  end
else
  puts "Please supply a project directory "
end
