class CreateUsers < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |k|
  		k.string :username, { null: false, uniqueness: true }
  		k.string :email, { null: false, uniqueness: true }
  		k.string :password_hash

  		k.timestamps
  	end
  end
end
