require 'spec_helper'

describe "publishers/show" do
  before(:each) do
    @publisher = assign(:publisher, stub_model(Publisher))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
