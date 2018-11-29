require 'spec_helper'

RSpec.describe 'the 3 thing' do
  it "asserts that 3 == 3" do
    sleep(0.01)
    expect(3).to eq(3)
  end
end
