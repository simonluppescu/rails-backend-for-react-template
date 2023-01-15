class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    drop_table :users

    create_table :users do |t|
      t.string :username
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt

      t.timestamps                null: false
    end
  end
end