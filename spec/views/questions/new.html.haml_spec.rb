require 'spec_helper'

describe "questions/new" do
  before(:each) do
    assign(:question, stub_model(Question,
      :title => "MyString",
      :question_type => "MyString",
      :content => "MyText",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => questions_path, :method => "post" do
      assert_select "input#question_title", :name => "question[title]"
      assert_select "input#question_question_type", :name => "question[question_type]"
      assert_select "textarea#question_content", :name => "question[content]"
      assert_select "input#question_state", :name => "question[state]"
    end
  end
end
