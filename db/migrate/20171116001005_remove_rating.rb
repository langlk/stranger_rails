class RemoveRating < ActiveRecord::Migration[5.0]
  def change
    remove_column :episodes, :rating
  end
end
