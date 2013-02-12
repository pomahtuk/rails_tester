require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :title => "MyString",
      :short => "MyText",
      :full => "MyText",
      :image_url => "MyString",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => articles_path, :method => "post" do
      assert_select "input#article_title", :name => "article[title]"
      assert_select "textarea#article_short", :name => "article[short]"
      assert_select "textarea#article_full", :name => "article[full]"
      assert_select "input#article_image_url", :name => "article[image_url]"
      assert_select "input#article_state", :name => "article[state]"
    end
  end
end
