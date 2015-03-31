class DropAccounTypeTable < ActiveRecord::Migration
  def change
    drop_table :account_types
  end
end
