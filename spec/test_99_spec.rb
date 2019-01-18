require 'spec_helper'

RSpec.describe 'the 99 thing' do
  it "asserts that 99 == 99" do
    fail 'oops'
    sleep(0.01)
    expect(99).to eq(99)
  end
end
