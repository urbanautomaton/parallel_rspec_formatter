require 'spec_helper'

RSpec.describe 'the 5 thing' do
  skip "asserts that 5 == 5" do
    sleep(0.01)
    expect(5).to eq(5)
  end
end
