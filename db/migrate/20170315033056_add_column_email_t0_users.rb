class AddColumnEmailT0Users < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string
    add_column :users, :admin, :boolean, :default => false
  end
end
