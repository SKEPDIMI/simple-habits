class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.string :title, :default => "", :null => false
      t.boolean :complete, :default => false, :null => false
      t.timestamps
    end
  end
end
