require 'thor/error'

module Rspec
  class New < Thor::Group
    include Thor::Actions

    desc "Sets up and installs rspec in a rails project"
    #def create_rails
    #  run("rails new #{name} --skip-test-unit")
    #end
    #
    #
    #def create_git
    #  if options[:git_account]
    #    thor(:"git:new" , name ,:account => options[:git_account])
    #  end
    #end

    def verify_rails
      unless File.exist?("Gemfile")
        puts "Command must be run at the top level of the rails app"
        exit
      end
    end

    def append_gem_file
      append_file("Gemfile" , "\ngem 'rspec-rails', :group => [:development, :test]")
    end

    def bundle_install
      run("bundle install")
    end

    def rspec_install
      run("rails generate rspec:install")
    end
  end
end