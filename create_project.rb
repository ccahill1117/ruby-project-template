require('fileutils')

project_directory = ARGV[0]
classes = (ARGV[1..-1])
ARGV.clear

if project_directory
  puts FileUtils.pwd()
  FileUtils.mkdir("./#{project_directory}")
  FileUtils.cd("./#{project_directory}")
  FileUtils.mkdir("./spec")
  FileUtils.mkdir("./lib")
  # FileUtils.touch("./Gemfile")
  file = File.open("./Gemfile", 'w') do |file|
    file.write("source 'https://rubygems.org'\n\ngem 'rspec'\ngem 'pivotal_git_scripts'\ngem 'pry'\n")
  end
  classes.each do |class_name|
    spec_file = File.open("./spec/#{class_name}_spec.rb", "w") do |file|
      file.write("require ('rspec')\nrequire ('#{class_name}')\nrequire ('pry')\n")
    end
    lib_file = File.open("./lib/#{class_name}.rb", "w") do |file|
      file.write("require ('pry')\n\n")
    end
  end
  p classes
else
  puts "Please supply a project directory "
end
