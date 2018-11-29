require 'spec_helper'

RSpec.describe 'the 60 thing' do
  it "asserts that 60 == 60" do
    sleep(0.01)
    expect(60).to eq(60)
  end
end
