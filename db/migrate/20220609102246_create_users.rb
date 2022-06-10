class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar
      t.string :about
      t.string :email
      t.string :password
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
