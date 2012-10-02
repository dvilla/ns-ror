require 'spec_helper'

describe "publishers/new" do
  before(:each) do
    assign(:publisher, stub_model(Publisher).as_new_record)
  end

  it "renders new publisher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publishers_path, :method => "post" do
    end
  end
end
