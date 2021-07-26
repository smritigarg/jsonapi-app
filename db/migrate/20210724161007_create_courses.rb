class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.references  :coach, index: true, foreign_key: true
      t.string      :name, null: false, limit: 64
      t.boolean     :self_assignable, default: false
      t.timestamps
    end
  end
end
