require 'rails_helper'

describe 'migrations' do
  context 'step 1' do
    it 'has been set up correctly' do
      expect(Account.count).to eql 10
      expect(User.count).to eq 10
    end
    it 'has account type' do
      expect(AccountType.count).to eql 3
    end
  end

  context 'step 2' do
=begin
    after do
      clear_bad_data
    end
    it 'does not allow null ssn' do
      expect{
        @user = User.create(
          first_name: 'Test',
          last_name: 'Guy',
          ssn: nil)
      }.to raise_error(ActiveRecord::StatementInvalid)
    end
=end
  end

  context 'step 3' do
=begin

    after do
      clear_bad_data
    end

    it 'defaults new account balance to 0' do
      opts_hash = {
        user_id: User.first.id
      }
      Account.first #stops flapping test somehow #TODO
      opts_hash[:account_type] = 'saving' if Account.method_defined?(:account_type)
      opts_hash[:account_type_id] = 1 if Account.method_defined?(:account_type_id)

      @account = Account.create(opts_hash)
      expect(@account.balance).to eql(0.0)
    end

    it 'allows setting of account balance' do
      opts_hash = {
        user_id: User.first.id,
        balance: 3.50
      }
      opts_hash[:account_type] = 'saving' if Account.method_defined?(:account_type)
      opts_hash[:account_type_id] = 1 if Account.method_defined?(:account_type_id)

      @account = Account.create(opts_hash)
      expect(@account.balance).to eql(3.50)

    end
    it 'migrated existing account balances correctly' do
      Account.all.each do |account|
        expect(account.balance).to eql 0.0
      end
    end
=end
  end

  context 'step 4' do
=begin
    after do
      clear_bad_data
    end
    it 'does not allow null login' do
      expect{
        @user = User.create(
          first_name: 'Test',
          last_name: 'Guy',
          ssn: 123456789,
          login: nil)
      }.to raise_error(ActiveRecord::StatementInvalid)
    end
    it 'has migrated existing users correctly' do
      User.all.each do |user|
        expect(user.login).to be_present
      end
    end
=end
  end

  context 'step 5' do
=begin
    after do
      clear_bad_data
    end
    it 'does not allow duplicate ssns' do
      expect{
        @user = User.create(
          first_name: 'Test',
          last_name: 'Guy',
          ssn: User.first.ssn,
          login: 'pwall')
      }.to raise_error(ActiveRecord::StatementInvalid)
    end
  end

  context 'step 6' do
    it 'enforces referential integrity' do
      bad_account_type_id = AccountType.order(:id).last.id + 1
      expect{
        @account = Account.create(
          account_type_id: bad_account_type_id,
          user_id: User.first.id )
      }.to raise_error(ActiveRecord::StatementInvalid)
    end
=end
  end

  context 'step 7' do
=begin
    #note: this is broken into parts to incrementally test your migrations.
    #Comment out one part at a time, get it to pass, comment it out & uncomment the next
    context 'part 1' do
      it 'account requires an account type' do
        expect{
          @account = Account.create(
            account_type_id: AccountType.first.id,
            user_id: User.first.id )
        }.to raise_error(ActiveRecord::StatementInvalid)
      end

      it 'existing accounts have correct account type' do
        Account.all.each do |account|
          expect(account.account_type).to eql AccountType.find(account.account_type_id).name
        end
      end

    end
    context 'part 2' do
      #Comment out test for step 6 when you run this test 
      it 'account does not accept account_type_id' do
        expect{
          @account = Account.create(
            account_type_id: AccountType.first.id,
            account_type: 'saving',
            user_id: User.first.id
          )
        }.to raise_error(ActiveRecord::UnknownAttributeError)
      end
    end
    context 'part 3' do
      #Comment out test for account type count (part 1)
      it 'account_type does not exist' do
        expect(AccountType.table_exists?).to be false
      end
    end
=end
  end

  def clear_bad_data
    @user.delete if @user.present?
    @account.delete if @account.present?
  end

end
