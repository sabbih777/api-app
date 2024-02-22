class AddAuthorizedUserRefToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :authorized_user, null: true, foreign_key: true
  end
end
