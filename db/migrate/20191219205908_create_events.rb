class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.string :description
      t.string :location
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
