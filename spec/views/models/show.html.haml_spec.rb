require 'spec_helper'

describe "models/show" do
  before(:each) do
    @model = assign(:model, stub_model(Model,
      :Course => "Course",
      :title => "Title",
      :short => "Short",
      :full => "Full",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Course/)
    rendered.should match(/Title/)
    rendered.should match(/Short/)
    rendered.should match(/Full/)
    rendered.should match(/State/)
  end
end
