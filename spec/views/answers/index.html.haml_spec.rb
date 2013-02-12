require 'spec_helper'

describe "answers/index" do
  before(:each) do
    assign(:answers, [
      stub_model(Answer,
        :title => "Title",
        :correct => false,
        :state => "State"
      ),
      stub_model(Answer,
        :title => "Title",
        :correct => false,
        :state => "State"
      )
    ])
  end

  it "renders a list of answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
