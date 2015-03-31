class AddAccountTypeToAccount < ActiveRecord::Migration
  def up
    add_column :accounts, :account_type, :string
    Account.all.each do |account|
      account.account_type = AccountType.find(account.account_type_id).name
      account.save!
    end
    change_column_null :accounts, :account_type, false
  end

  def down
    remove_column :accounts, :account_type
  end
end
