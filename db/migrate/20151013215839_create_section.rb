class CreateSection < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
