# frozen_string_literal: true

RSpec.describe 'Strings' do
  context 'hello' do
    it 'returns' do
      expect('hello').to eq 'hello'
    end

    it 'does not returns' do
      expect('hello').to eq 'hello2'
    end
  end
end
