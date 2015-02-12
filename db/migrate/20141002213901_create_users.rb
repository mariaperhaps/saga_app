class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :about_me
      t.string :image_url
      t.string :gender
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
