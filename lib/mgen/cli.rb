require "thor"
require "thor/group"
# require "pry"
require "erubis"

module Mgen
  class CLI < Thor
    include Utils
    include Thor::Actions

    no_tasks {
      def cli_error(message, exit_status=nil)
        $stderr.puts message
        exit_status = STATUS_TYPES[exit_status] if exit_status.is_a?(Symbol)
        exit(exit_status || 1)
      end

      def create(name)
        @project_name = name
        begin
          generate_files
          say "Your mruby gem is ready for you to get coding!", :green
        rescue => e
          say "There was an error generating mgem. #{e}", :red
          say e.backtrace.join("\r\n")
        end
      end

      def generate_files
        @project_dir = underscore(@project_name)

        full_app_hash = {
          :app_name => @project_name,
          :app_name_underscore => @project_dir,
          :platform => @device_platform
        }

        create_project_directory
        create_with_template("#{@project_dir}/LICENSE", 'defaults/LICENSE', full_app_hash)
        create_with_template("#{@project_dir}/mrbgem.rake", 'defaults/mrbgem.rake', full_app_hash)
        create_with_template("#{@project_dir}/build_config.rb", 'defaults/build_config.rb', full_app_hash)
        create_with_template("#{@project_dir}/Rakefile", 'defaults/Rakefile', full_app_hash)
      end

      def create_project_directory
        create_directories( @project_dir )
        dirs = %w(docs mrblib test include src test bin).map{|o| "#{@project_dir}/#{o}"}
        create_directories(*dirs)
      end

    }

    map %w(--version -v) => 'info'
    desc "info", "information about Mgen."
    def info
      say "Version #{Mgen::VERSION}"
    end

    map %(n) => 'new'
    desc "new <name> ", "generates a new mgem project."
    long_desc "Generates a new mgem project. See 'mgen help new' for more information.
              \n\nExample:
              \n\nmgen new demo ==> Creates a new mruby gem skeleton."
    def new(name)
      if File.exist?(base_location.join(name))
        if yes? "#{name} already exists, do you want to override? (yes or no)", :yellow
          create(name)
        else
          say "Skipping #{name} because it already exists", :green
        end
      else
        create(name)
      end

    end

    map %w(--build -b) => 'build'
    desc "build", "buid app with productbuild "
    def build
      say "Version #{Mgen::VERSION}"
    end
  end
end
