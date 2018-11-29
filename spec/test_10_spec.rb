require 'spec_helper'

RSpec.describe 'the 10 thing' do
  it "asserts that 10 == 10" do
    sleep(0.01)
    expect(10).to eq(10)
  end
end
