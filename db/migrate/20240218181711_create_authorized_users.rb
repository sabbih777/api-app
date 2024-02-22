class CreateAuthorizedUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :authorized_users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
