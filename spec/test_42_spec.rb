require 'spec_helper'

RSpec.describe 'the 42 thing' do
  it "asserts that 42 == 42" do
    sleep(0.01)
    expect(42).to eq(42)
  end
end
