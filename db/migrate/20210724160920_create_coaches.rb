class CreateCoaches < ActiveRecord::Migration[6.0]
  def change
    create_table :coaches do |t|
      t.string      :name, null: false, limit: 64
      t.timestamps
    end
  end
end
