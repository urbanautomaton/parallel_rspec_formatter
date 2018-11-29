require 'spec_helper'

RSpec.describe 'the 30 thing' do
  it "asserts that 30 == 30" do
    sleep(0.01)
    expect(30).to eq(30)
  end
end
