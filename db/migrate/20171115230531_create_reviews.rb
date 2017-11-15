class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.column :episode_id, :integer
      t.column :rating, :integer
      t.column :content, :string
      t.column :author, :string

      t.timestamps
    end
  end
end
