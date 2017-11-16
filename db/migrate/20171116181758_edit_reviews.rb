class EditReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :author
    add_column :reviews, :user_id, :integer
  end
end
