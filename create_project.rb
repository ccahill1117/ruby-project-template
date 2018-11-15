require('fileutils')

project_directory = ARGV[0]

if project_directory.length > 0
  puts FileUtils.pwd()
  FileUtils.mkdir("./#{project_directory}")
  FileUtils.cd("./#{project_directory}")
  FileUtils.mkdir("./spec")
  FileUtils.mkdir("./lib")
else
  puts "Please supply a project directory "
end
