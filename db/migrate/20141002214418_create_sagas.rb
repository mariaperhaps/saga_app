class CreateSagas < ActiveRecord::Migration
  def change
    create_table :sagas do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
