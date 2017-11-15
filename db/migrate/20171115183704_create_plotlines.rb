class CreatePlotlines < ActiveRecord::Migration[5.0]
  def change
    create_table :plotlines do |t|
      t.column :name, :string
      t.column :description, :string

      t.timestamps
    end
  end
end
