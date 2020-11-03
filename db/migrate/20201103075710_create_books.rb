class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false, default: ''
      t.string :body, null: false, default: ''
      t.integer :user_id

      t.timestamps
    end
  end
end
