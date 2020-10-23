class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.text :description
      t.belongs_to :city, index: true
      
      t.timestamps
    end
  end
end
