class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.column :title, :string
      t.column :season, :integer
      t.column :number, :integer
      t.column :description, :string
      t.column :rating, :float

      t.timestamps
    end
  end
end
