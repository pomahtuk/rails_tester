require 'spec_helper'

describe "models/new" do
  before(:each) do
    assign(:model, stub_model(Model,
      :Course => "MyString",
      :title => "MyString",
      :short => "MyString",
      :full => "MyString",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => models_path, :method => "post" do
      assert_select "input#model_Course", :name => "model[Course]"
      assert_select "input#model_title", :name => "model[title]"
      assert_select "input#model_short", :name => "model[short]"
      assert_select "input#model_full", :name => "model[full]"
      assert_select "input#model_state", :name => "model[state]"
    end
  end
end
