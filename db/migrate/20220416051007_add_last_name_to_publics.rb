class AddLastNameToPublics < ActiveRecord::Migration[6.1]
  def change
    add_column :publics, :last_name, :string, null: false
    add_column :publics, :first_name, :string, null: false
    add_column :publics, :last_name_kana, :string, null: false
    add_column :publics, :first_name_kana, :string, null: false
    add_column :publics, :postal_code, :string, null: false
    add_column :publics, :address, :string, null: false
    add_column :publics, :telephone_number, :string, null: false
    add_column :publics, :is_active, :boolean, null: false, default: true
    
  end
end
