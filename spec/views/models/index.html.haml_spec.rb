require 'spec_helper'

describe "models/index" do
  before(:each) do
    assign(:models, [
      stub_model(Model,
        :Course => "Course",
        :title => "Title",
        :short => "Short",
        :full => "Full",
        :state => "State"
      ),
      stub_model(Model,
        :Course => "Course",
        :title => "Title",
        :short => "Short",
        :full => "Full",
        :state => "State"
      )
    ])
  end

  it "renders a list of models" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Course".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Short".to_s, :count => 2
    assert_select "tr>td", :text => "Full".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
