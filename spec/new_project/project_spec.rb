require 'spec_helper'

describe NewProject::Project do

  let(:project) { new_project }

  it "responds to #snake_name" do
    expect(project.snake_name).to eq('test_project')
  end

  it "responds to #camel_name" do
    expect(project.camel_name).to eq('TestProject')
  end

  it "responds to #to_h" do
    expect(project.to_h).to eq({
                      :snake_name => 'test_project',
                      :camel_name => 'TestProject'
                    })
  end

end

def new_project
  NewProject::Project.new('test_project')
end
