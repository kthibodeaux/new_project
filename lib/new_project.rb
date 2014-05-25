require 'new_project/project'
require 'new_project/template'

require 'erb'
require 'fileutils'

module NewProject

  VERSION = '0.0.1'

  def self.root
    File.expand_path('../..', __FILE__)
  end

end

class String

  def camelcase
    downcase.gsub('_', ' ').split(/(\W)/).
      map(&:capitalize).join.delete(' ')
  end

end
