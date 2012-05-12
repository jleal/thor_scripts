
module Rails
  class New < Thor::Group
    include Thor::Actions

    argument :name , :type => :string,
              :desc => "rails project name"

    class_option :git_account , :aliases => "-g" ,
                 :desc => "git account name, creates git repo and does first commit if provided"

    desc "Creates a new rails project plus more!!!"

    def create_rails
      run("rails new #{name} --skip-test-unit")
      inside name do
        thor(:"rspec:new")
      end
    end

    def create_git
      if options[:git_account]
        thor(:"git:new" , name ,:account => options[:git_account])
      end
    end
  end
end