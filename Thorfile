
#Be sure to add lines in your environment for these env vars:
#  THOR_FILES
#  THOR_TEMPLATES
#
#  Example:
#    #/Users/jleal/.profile
#    export THOR_FILES=/Users/jleal/.thor_files
#    export THOR_TEMPLATES=/Users/jleal/.thor_files/templates
#
#Make sure to add THOR_FILES to your source_paths of your thor script
#
#  Example:
#    class MyThor < Thor::Group
#      include Thor::Actions
#
#      def self.source_root
#        File.join(File.dirname(__FILE__) , "..")
#      end
#
#      def setup
#        source_paths << ENV["THOR_FILES"]
#      end
#    end


class InstallMe < Thor::Group
  include Thor::Actions

  desc "Installs thor files to the require location"

  argument :dir, :type => :string ,
           :desc => "root directory to search for log files to install",
           :default => "./"

  def self.source_root
    File.dirname(__FILE__)
  end

  def install_thor_files
    Dir.glob(File.join(dir, "**/*.thor")).each do |thor_file|
      thor(:install, thor_file)
    end
  end

  def copy_template_files
    Dir.glob("templates/*").each do |template_file|
      copy_file(template_file ,"#{ENV["THOR_TEMPLATES"]}/#{File.basename(template_file)}")
    end
  end
end