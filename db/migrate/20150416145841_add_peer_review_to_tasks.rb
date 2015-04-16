class AddPeerReviewToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :review_status, :string
  	add_column :tasks, :review_sent_date, :date
    add_column :tasks, :review_date, :date

    add_index :tasks, :review_status
  end
end
