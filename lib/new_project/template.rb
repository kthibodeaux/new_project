module NewProject
  class Template
    attr_reader :name, :path, :project, :contents

    def initialize(project, name, path)
      @project  = project.to_h
      @name     = name
      @path     = path
      @contents = raw
    end

    def render
      ERB.new(contents).result(binding)
    end

    def save
      File.open("./#{project[:snake_name]}/#{path}", 'w') do |f|
        f.puts render
      end
    end

    private

    def raw
      raw_file = File.open("#{NewProject.root}/templates/#{name}.erb", 'r')
      contents = raw_file.read
      raw_file.close
      contents
    end

  end
end
