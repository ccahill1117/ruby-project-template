require('fileutils')

project_directory = ARGV[0]
classes = (ARGV[1..-1])
ARGV.clear

if project_directory
  FileUtils.mkdir("./#{project_directory}")
  FileUtils.cd("./#{project_directory}")
  FileUtils.mkdir("./spec")
  FileUtils.mkdir("./lib")
  file = File.open("./Gemfile", 'w') do |file|
    file.write("source 'https://rubygems.org'\n\ngem 'rspec'\ngem 'pivotal_git_scripts'\ngem 'pry'\n")
  end
  classes.each do |class_name|
    camelName = class_name.gsub(/(_|^)(\w)/){$2.upcase}
    spec_file = File.open("./spec/#{class_name}_spec.rb", "w") do |file|
      file.write("require ('rspec')\nrequire ('#{class_name}')\nrequire ('pry')\n\ndescribe('#{camelName}#_____') do\nend\n")
    end
    lib_file = File.open("./lib/#{class_name}.rb", "w") do |file|
      file.write("require ('pry')\n\nclass #{camelName}\nend\n")
    end
  end
else
  puts "Please supply a project directory "
end
