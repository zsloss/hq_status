class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :flow
      t.string :product
      t.string :doc_type
      t.date :start_date
      t.integer :priority
      t.string :status
      t.string :region
      t.boolean :done
      t.integer :draft
      t.date :draft_submitted
      t.date :completion_date
      t.text :notes

      t.timestamps null: false
    end
  end
end
