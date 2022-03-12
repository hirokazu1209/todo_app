class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string  :title
      t.text    :detail
      t.data    :expire_date
      t.boolean :is_checked
      t.integer :label

      t.timestamps
    end
  end
end
