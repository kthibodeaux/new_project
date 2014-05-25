require 'spec_helper'

describe NewProject::Template do

  before(:all) { prepare }
  after(:all)  { cleanup }

  let(:project)  { new_project }
  let(:template) { NewProject::Template.new(project, 'temp', 'bin/greet.rb') }

  it "responds to #render" do
    expect(template.render).to eq("puts 'hello, TestProject'\n")
  end

  it "responds to #save" do
    template.save
    output = File.open("#{project.snake_name}/bin/greet.rb")
    contents = output.read
    output.close
    expect(contents).to eq("puts 'hello, TestProject'\n")
  end

end

def prepare
  FileUtils.mkpath("test_project/bin")
  File.open('templates/temp.erb', 'w') do |f|
    f.puts "puts 'hello, <%= project[:camel_name] %>'"
  end
end

def cleanup
  File.delete('templates/temp.erb')
  File.delete("#{project.snake_name}/bin/greet.rb")
  Dir.delete("#{project.snake_name}/bin")
  Dir.delete(project.snake_name)
end
