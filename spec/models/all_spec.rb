require 'rails_helper'

describe 'migrations' do
  context 'step 0' do
    it 'has been set up correctly' do
      expect(Account.count).to eql 10
      expect(AccountType.count).to eql 3
      expect(User.count).to eq 10
    end
  end
end
