class CreateClasssessions < ActiveRecord::Migration[5.0]
  def change
    create_table :classsessions do |t|
      t.datetime :happened_at
      t.text :theme
      t.integer :length
      t.integer :participants
      t.text :comments
      t.integer :format_id
      t.integer :studio_id
      t.integer :user_id

      t.timestamps

    end
  end
end
