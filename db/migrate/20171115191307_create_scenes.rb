class CreateScenes < ActiveRecord::Migration[5.0]
  def change
    create_table :scenes do |t|
      t.column :plotline_id, :integer
      t.column :episode_id, :integer
      t.column :description, :string

      t.timestamps
    end
  end
end
