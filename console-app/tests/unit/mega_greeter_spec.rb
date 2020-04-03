# frozen_string_literal: true

describe MegaGreeterTest do
  it 'say hi to world as default' do
    greeter = MegaGreeter.new

    expect(greeter.say_hi).to eq 'Hello World!'
  end
end
