require 'spec_helper'

describe "publishers/edit" do
  before(:each) do
    @publisher = assign(:publisher, stub_model(Publisher))
  end

  it "renders the edit publisher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publishers_path(@publisher), :method => "post" do
    end
  end
end
