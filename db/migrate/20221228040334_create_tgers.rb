class CreateTgers < ActiveRecord::Migration[7.0]
  def change
    create_table :tgers do |t|
      t.string :title
      t.references :tg, null: false, foreign_key: true

      t.timestamps
    end
  end
end
