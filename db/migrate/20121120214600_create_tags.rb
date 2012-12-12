class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :text
      t.integer :post_id

      t.timestamps
    end
  end
end
