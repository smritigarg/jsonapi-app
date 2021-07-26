class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :course, index: true, foreign_key: true
      t.string :name, null: false, limit: 64
      t.timestamps
    end
  end
end
