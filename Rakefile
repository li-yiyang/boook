# This Rakefile is aimed to quickly generate,
# clean the LaTeX file. Although it is not
# so relevant with boook project.
require 'yaml' # config.yml for configuration
require 'open3' # for error capture
require 'colorize' # for colored output
require 'fiber_scheduler' # fiber scheduler

CONFIG_PATH = "config.yml"

def config(choose = :store)
  if choose == :store && File.exist?(CONFIG_PATH)
    return YAML.load(File.read(CONFIG_PATH))
  else
    return {
      defualt_name: [
        "main.tex", # in memory of my analysis teacher dz
        # "example.tex"
      ],
      rule: [
        :build_twice_with_shell_escape,
        :clear_file
      ],
      clear: [
        "*.aux",
        "*.log",
        "*.out",
        "*.toc",
        # "_minted-*" # folder
      ]
    }
  end
end

def hook_shell_commands(cmd)
  puts cmd.yellow
  # I'm now having headache with the error handling...
  # I think it could not be solved yet... 
  Open3.popen3(cmd) do |stdin, stdout, stderr, wait|
    FiberScheduler do
      Fiber.schedule { while (read = stdout.gets); print read.force_encoding("utf-8").light_white; end }
      Fiber.schedule { while (read = stderr.gets); print read.force_encoding("utf-8").red; end }
    end
  end
end

def input_argv_file
  file = ARGV[1]
  if (!(file.nil?) && File.exist?(file))
    return file
  else
    puts "File #{file} not found, retry with a right file name or see help".red
    exit
  end
end

def build_with_shell_escape()
  hook_shell_commands("xelatex -shell-escape #{input_argv_file}")
end

desc "Generate basic config.yml"
task :generate_config do
  if File.exist?(CONFIG_PATH)
    puts "Configuration file: #{CONFIG_PATH} already exists. "
    print "Overwrite? [N/y]"
    exit unless STDIN.gets().strip().downcase() == 'y'
  end
  File.open(CONFIG_PATH, 'w') do |f|
    f.write(YAML.dump(config(:basic)))
  end
  puts "#{CONFIG_PATH} generated."
end

desc "Run all in one"
task :one do
  config[:rule].each do |rule|
    puts rule.to_s.green
    Rake::Task[rule].invoke
  end
end

desc "Build with -shell-escape\nSyntax: + <example.tex>"
task :build_twice_with_shell_escape do
  build_with_shell_escape()
  build_with_shell_escape()
end

desc "Clear temp file, note that you should be careful with your rule. "
task :clear_file do
  config[:clear].each do |pattern|
    hook_shell_commands("rm #{pattern}")
  end
end
