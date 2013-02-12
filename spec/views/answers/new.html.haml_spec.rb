require 'spec_helper'

describe "answers/new" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :title => "MyString",
      :correct => false,
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => answers_path, :method => "post" do
      assert_select "input#answer_title", :name => "answer[title]"
      assert_select "input#answer_correct", :name => "answer[correct]"
      assert_select "input#answer_state", :name => "answer[state]"
    end
  end
end
