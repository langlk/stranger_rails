class AddUserScenes < ActiveRecord::Migration[5.0]
  def change
    add_column :scenes, :user_id, :integer
  end
end
