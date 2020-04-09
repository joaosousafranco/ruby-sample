# frozen_string_literal: true

require 'factory_bot'

# User class
class User
  def initialize(first_name = nil, last_name = '', admin = false)
    @first_name = first_name
    @last_name = last_name
    @admin = admin
  end

  def full_name
    @first_name + ' ' + @last_name
  end

  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :admin
end

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    admin { false }
  end
end

RSpec.describe 'Greeter' do
  context 'Greeting' do
    it 'Greeter is portuguese' do
      portuguese_greeter = build(:user)

      expect(portuguese_greeter.first_name).to eq 'John'
    end
  end
end
