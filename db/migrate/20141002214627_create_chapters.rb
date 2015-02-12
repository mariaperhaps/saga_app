class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.string :scope
      t.string :tags
      t.string :category
      t.references :saga, index: true

      t.timestamps
    end
  end
end
