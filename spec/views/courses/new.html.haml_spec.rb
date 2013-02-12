require 'spec_helper'

describe "courses/new" do
  before(:each) do
    assign(:course, stub_model(Course,
      :title => "MyString",
      :short => "MyString",
      :full => "MyString",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => courses_path, :method => "post" do
      assert_select "input#course_title", :name => "course[title]"
      assert_select "input#course_short", :name => "course[short]"
      assert_select "input#course_full", :name => "course[full]"
      assert_select "input#course_state", :name => "course[state]"
    end
  end
end
