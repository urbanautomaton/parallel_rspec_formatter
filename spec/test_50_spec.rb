require 'spec_helper'

RSpec.describe 'the 50 thing' do
  it "asserts that 50 == 50" do
    sleep(0.01)
    expect(50).to eq(50)
  end
end
