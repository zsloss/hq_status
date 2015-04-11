class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :flow
      t.string :product
      t.string :doc_type
      t.date :start_date
      t.string :revision
      t.string :version
      t.string :status
      t.string :region
      t.boolean :done
      t.integer :draft
      t.date :draft_submitted
      t.date :completion_date
      t.text :notes
      t.integer :writer_id
      t.integer :reviewer_id
      t.timestamps null: false

      t.index :writer_id
      t.index :reviewer_id
    end
  end
end
