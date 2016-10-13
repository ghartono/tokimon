class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.integer :tid
      t.string :tname
      t.integer :level

      t.timestamps null: false
    end
  end
end
