class CreateTgs < ActiveRecord::Migration[7.0]
  def change
    create_table :tgs do |t|
      t.string :name
      t.text :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
