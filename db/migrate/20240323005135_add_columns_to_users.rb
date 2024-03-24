class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, default: "名無し", null: false
    add_column :users, :profile_image, :string
    add_column :users, :profile, :text
  end
end
