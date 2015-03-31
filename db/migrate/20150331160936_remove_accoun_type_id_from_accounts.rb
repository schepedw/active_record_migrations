class RemoveAccounTypeIdFromAccounts < ActiveRecord::Migration
  def up
    remove_foreign_key :accounts, :account_types
    remove_column :accounts, :account_type_id
  end

  def down
    add_column :accounts, :account_type_id, :integer
    add_foreign_key :accounts, :account_types
  end
end
