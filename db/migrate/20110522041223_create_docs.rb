class CreateDocs < ActiveRecord::Migration
  def self.up
    create_table :docs do |t|
      t.string :name
      t.integer :user_id
      t.string :pad_id

      t.timestamps
    end
  end

  def self.down
    drop_table :docs
  end
end
