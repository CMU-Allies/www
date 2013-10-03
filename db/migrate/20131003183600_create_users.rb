class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.string :remember_token
      t.datetime :remember_token_expires_at
      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.boolean :editor
      t.string :old_hash

      t.timestamps
    end
  end
end
