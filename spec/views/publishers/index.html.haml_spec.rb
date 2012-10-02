require 'spec_helper'

describe "publishers/index" do
  before(:each) do
    assign(:publishers, [
      stub_model(Publisher),
      stub_model(Publisher)
    ])
  end

  it "renders a list of publishers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
