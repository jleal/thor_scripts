

module Git
  class New < Thor::Group
    include Thor::Actions

    argument :name, :type => :string , :desc => "the name of repo/project"
    class_option :account, :aliases => "-a" ,
                 :desc => "git provider account" , :required => true
    class_option :provider, :aliases => "-p" ,
                 :desc => "git repository provider",
                 :default => "github"

    desc "setup a project on the git repo. Git repo and account should exist first"
    def setup
      provider_url =  case options[:provider]
                        when "github"
                          "git@github.com"
                        else
                          puts "provider not defined"
                          return
                      end

      case
        #project directory doesn't exist
        when !Dir.exists?(name)
          run "mkdir #{name}"
          inside name do
            run "git init"
            run "touch README"
            run "git add ."
            run "git commit -m 'first commit'"
            run "git remote add origin git@github.com:#{options[:account]}/#{name}.git"
            run "git push -u origin master"
          end
        #project dir exists but git init has not been run on it
        when !Dir.exist?(File.join(name, ".git"))
          inside name do
            run "git init"
            run "touch README"
            run "git add ."
            run "git commit -m 'first commit'"
          end
      end


      inside name do
        run "git remote add origin git@github.com:#{options[:account]}/#{name}.git"
        run "git push -u origin master"
      end
    end
  end
end

